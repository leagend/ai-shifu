import { useState } from "react";
import { getLessonTree } from 'Api/lesson.js';
import { produce } from 'immer';
import { LESSON_STATUS_VALUE } from "constants/courseConstants.js";
import { useTracking, EVENT_NAMES } from "common/hooks/useTracking.js";
import { useEnvStore } from 'stores/envStore.js';
import { useCallback } from "react";
export const checkChapterCanLearning = ({ status, status_value }) => {
  return status_value === LESSON_STATUS_VALUE.LEARNING || status_value === LESSON_STATUS_VALUE.COMPLETED || status_value === LESSON_STATUS_VALUE.PREPARE_LEARNING;
};

export const useLessonTree = () => {
  const [tree, setTree] = useState(null);
  const [selectedLessonId, setSelectedLessonId] = useState(null);
  const { trackEvent } = useTracking();
  const { updateCourseId } = useEnvStore.getState();

  const getCurrElement = useCallback(async () => {
    if (!tree || !selectedLessonId) {
      return { catalog: null, lesson: null }
    }

    for (const catalog of tree.catalogs) {
      const lesson = catalog.lessons.find(v => v.id === selectedLessonId);
      if (lesson) {
        return { catalog, lesson };
      }
    }
    return { catalog: null, lesson: null };
  }, [selectedLessonId, tree])

  const initialSelectedChapter = useCallback((tree) => {
    console.log('initialSelectedChapter');
    let catalog = tree.catalogs.find(v => v.status_value === LESSON_STATUS_VALUE.LEARNING);
    if (catalog) {
      const lesson = catalog.lessons.find(v => v.status_value === LESSON_STATUS_VALUE.LEARNING || v.status_value === LESSON_STATUS_VALUE.PREPARE_LEARNING);
      lesson && setSelectedLessonId(lesson.id);
    } else {
      catalog = tree.catalogs.find(v => v.status_value === LESSON_STATUS_VALUE.PREPARE_LEARNING);
      if (catalog) {
        const lesson = catalog.lessons.find(v => v.status_value === LESSON_STATUS_VALUE.LEARNING || v.status_value === LESSON_STATUS_VALUE.PREPARE_LEARNING);
        lesson && setSelectedLessonId(lesson.id);
      }
    }
  }, []);

  const loadTreeInner = useCallback(async () => {
    setSelectedLessonId(null);
    const resp = await getLessonTree(useEnvStore.getState().courseId);

    const treeData = resp.data;
    if (!treeData) {
      return null;
    }

    if (treeData.course_id !== useEnvStore.getState().courseId) {
      await updateCourseId(treeData.course_id);
    }

    let lessonCount = 0;
    const catalogs = treeData.lessons.map(l => {
      const lessons = l.children.map(c => {
        lessonCount += 1;
        return {
          id: c.lesson_id,
          name: c.lesson_name,
          status: c.status,
          status_value: c.status_value,
          canLearning: checkChapterCanLearning(c),
        };
      });

      return {
        id: l.lesson_id,
        name: l.lesson_name,
        status: l.status,
        status_value: l.status_value,
        lessons,
        collapse: false,
        bannerInfo: l.banner_info,
      };
    });

    const newTree = {
      catalogCount: catalogs.length,
      catalogs,
      lessonCount,
      bannerInfo: treeData.banner_info,
    };

    console.log('load tree inner', newTree);
    return newTree;
  }, [updateCourseId]);


  const setSelectedState = useCallback((tree, chapterId, lessonId) => {
    const chapter = tree.catalogs.find(v => v.id === chapterId);

    if (!chapter) {
      return false;
    }

    let lesson = null;
    if (lessonId) {
      lesson = chapter.lessons.find(v => v.id === lessonId);
    }

    if (!lesson) {
      lesson = chapter.lessons.find(v => v.status_value === LESSON_STATUS_VALUE.LEARNING || v.status === LESSON_STATUS_VALUE.PREPARE_LEARNING);
    }

    if (!lesson) {
      return false;
    }

    setSelectedLessonId(lesson.id);
    return true;
  }, []);

  // 用于重新加载课程树，但保持临时状态
  const reloadTree = useCallback(async (chapterId = 0, lessonId = 0) => {
    const newTree = await loadTreeInner();
    console.log('reload Tree', newTree)
    initialSelectedChapter(newTree);
    // 设置 collapse 状态
    await newTree.catalogs.forEach(c => {
      const oldCatalog = tree.catalogs.find(oc => oc.id === c.id);

      if (oldCatalog) {
        c.collapse = oldCatalog.collapse;
      }
    });
    setTree(newTree);
    return newTree;
  }, [loadTreeInner, tree]);

  const loadTree = useCallback(async (chapterId = '', lessonId = '') => {
    let newTree = null;
    if (!tree) {
      newTree = await loadTreeInner();
    } else {
      newTree = tree;
    }

    const selected = setSelectedState(newTree, chapterId, lessonId);
    console.log('loadTree', selected);
    if (!selected) {
      initialSelectedChapter(newTree);
    }
    setTree(newTree);

    return newTree;
  }, [initialSelectedChapter, loadTreeInner, setSelectedState, tree]);

  const updateSelectedLesson = async (lessonId, forceExpand = false) => {
    console.log('lesson tree updateSelectedLesson', lessonId);
    setSelectedLessonId(lessonId);
    setTree(old => {
      if (!old) {
        return;
      }

      const nextState = produce(old, draft => {
        draft.catalogs.forEach(c => {
          c.lessons.forEach(ls => {
            if (ls.id === lessonId) {
              if (forceExpand) {
                c.collapse = false;
              }
            }
          });
        });
      });
      return nextState;
    });
  };

  const setCurrCatalog = async (catalogId) => {
    if (!tree) {
      return;
    }
    const ca = tree.catalogs.find(c => c.id === catalogId);
    if (!ca) {
      return;
    }
    const l = ca.lessons[0];
    if (!l) {
      return;
    }

    updateSelectedLesson(l.id);
  };

  const toggleCollapse = ({ id }) => {
    const nextState = produce(tree, draft => {
      draft.catalogs.forEach(c => {
        if (c.id === id) {
          c.collapse = !c.collapse;
        }
      });
    });

    setTree(nextState);
  };

  const updateLesson = (id, val) => {
    setTree(old => {
      if (!old) {
        return;
      }
      const nextState = produce(old, draft => {
        draft.catalogs.forEach(c => {
          const idx = c.lessons.findIndex(ch => ch.id === id);
          if (idx !== -1) {
            const newLesson = {
              ...c.lessons[idx],
              ...val
            };
            newLesson.canLearning = checkChapterCanLearning(newLesson);
            c.lessons[idx] = newLesson;
          }
        });
      });

      return nextState;
    });
  };

  const updateChapterStatus = (id, { status, status_value }) => {
    setTree(old => {
      if (!old) {
        return;
      }

      const nextState = produce(old, draft => {
        const idx = draft.catalogs.findIndex(ch => ch.id === id);
        if (idx !== -1) {
          draft.catalogs[idx] = {
            ...draft.catalogs[idx],
            status,
            status_value
          };
        }
      });

      return nextState;
    });
  };

  const getChapterByLesson = (lessonId) => {
    const chapter = tree.catalogs.find(ch => {
      return ch.lessons.find(ls => ls.id === lessonId);
    });

    return chapter;
  };

  const onTryLessonSelect = ({ lessonId }) => {
    if (!tree) {
      return;
    }

    let from = '';
    let to = '';

    for (const catalog of tree.catalogs) {
      const lesson = catalog.lessons.find(v => v.id === selectedLessonId);

      if (lesson) {
        from = `${catalog.name}|${lesson.name}`;
      }

      const toLesson = catalog.lessons.find(v => v.id === lessonId);
      if (toLesson) {
        to = `${catalog.name}|${toLesson.name}`;
      }
    }

    const eventData = {
      from,
      to,
    };

    trackEvent(EVENT_NAMES.NAV_SECTION_SWITCH, eventData);
  };


  return {
    tree,
    selectedLessonId,
    loadTree,
    reloadTree,
    updateSelectedLesson,
    setCurrCatalog,
    toggleCollapse,
    updateLesson,
    updateChapterStatus,
    getCurrElement,
    getChapterByLesson,
    onTryLessonSelect,
  };
};
