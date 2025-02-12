import { useEffect, useState, useCallback } from 'react';
import { useParams } from 'react-router-dom';
import classNames from 'classnames';
import styles from './NewChatPage.module.scss';
import { Skeleton } from 'antd';
import {
  calcFrameLayout,
  FRAME_LAYOUT_MOBILE,
  inWechat,
} from 'constants/uiConstants.js';
import { useUiLayoutStore } from 'stores/useUiLayoutStore.js';
import { useUserStore } from 'stores/useUserStore.js';
import { AppContext } from 'Components/AppContext.js';
import NavDrawer from './Components/NavDrawer/NavDrawer.jsx';
import ChatUi from './Components/ChatUi/ChatUi.jsx';
import LoginModal from './Components/Login/LoginModal.jsx';
import { useLessonTree } from './hooks/useLessonTree.js';
import { useCourseStore } from 'stores/useCourseStore';
import TrackingVisit from 'Components/TrackingVisit.jsx';
import ChatMobileHeader from './Components/ChatMobileHeader.jsx';
import { useDisclosture } from 'common/hooks/useDisclosture.js';
import { updateWxcode } from 'Api/user.js';

import FeedbackModal from './Components/FeedbackModal/FeedbackModal.jsx';
import PayModalM from 'Pages/NewChatPage/Components/Pay/PayModalM.jsx';
import PayModal from 'Pages/NewChatPage/Components/Pay/PayModal.jsx';
import { useTranslation } from 'react-i18next';
import { useEnvStore } from 'stores/envStore.js';
import { shifu } from 'Service/Shifu.js';
import { EVENT_NAMES, events } from './events.js';
import { useSystemStore } from 'stores/useSystemStore.js';
import { useShallow } from 'zustand/react/shallow';

// the main page of course learning
const NewChatPage = (props) => {
  const { frameLayout, updateFrameLayout } = useUiLayoutStore((state) => state);
  const [loginModalOpen, setLoginModalOpen] = useState(false);
  const [payModalOpen, setPayModalOpen] = useState(false);
  const [payModalState, setPayModalState] = useState({
    type: '',
    payload: {},
  });
  const [initialized, setInitialized] = useState(false);
  const { hasLogin, userInfo, hasCheckLogin } = useUserStore((state) => state);
  const [language, setLanguage] = useState(userInfo?.language || 'en-US');
  const [userSettingBasicInfo, setUserSettingBasicInfo] = useState(false);
  const [loadedChapterId, setLoadedChapterId] = useState(null);
  const [showUserSettings, setShowUserSettings] = useState(false);
  const [loginOkHandlerData, setLoginOkHandlerData] = useState(null);

  const {
    tree,
    selectedLessonId,
    loadTree,
    reloadTree,
    updateSelectedLesson,
    toggleCollapse,
    getCurrElement,
    updateLesson,
    updateChapterStatus,
    getChapterByLesson,
    onTryLessonSelect,
  } = useLessonTree();

  const { lessonId, updateLessonId, chapterId, updateChapterId, courseName } =
    useCourseStore(
      useShallow((state) => ({
        courseName: state.courseName,
        lessonId: state.lessonId,
        updateLessonId: state.updateLessonId,
        chapterId: state.chapterId,
        updateChapterId: state.updateChapterId,
      }))
    );

  const {
    open: feedbackModalOpen,
    onOpen: onFeedbackModalOpen,
    onClose: onFeedbackModalClose,
  } = useDisclosture();
  const { i18n } = useTranslation();

  const mobileStyle = frameLayout === FRAME_LAYOUT_MOBILE;

  const {
    open: navOpen,
    onClose: onNavClose,
    onToggle: onNavToggle,
  } = useDisclosture({
    initOpen: mobileStyle ? false : true,
  });

  const { courseId } = useParams();
  const { updateCourseId } = useEnvStore.getState();
  const { wechatCode } = useSystemStore(
    useShallow((state) => ({ wechatCode: state.wechatCode }))
  );

  const fetchData = useCallback(async () => {
    if (tree) {
      const data = await getCurrElement();
      console.log('getCurrElement', data);
      if (data && data.lesson) {
        updateLessonId(data.lesson.id);
        if (data.catalog) {
          updateChapterId(data.catalog.id);
        }
      }
    }
  }, [updateLessonId, getCurrElement, tree, updateChapterId]);

  const loadData = useCallback(async () => {
    console.log(
      `before loadTree, chapterId:${chapterId}, lessonId: ${lessonId}`
    );
    await loadTree(chapterId, lessonId);
  }, [chapterId, lessonId, loadTree]);

  const initAndCheckLogin = useCallback(async () => {
    if (inWechat() && wechatCode) {
      console.log(`updateWxcode: ${wechatCode}`);
      await updateWxcode({ wxcode: wechatCode });
    }
    setInitialized(true);
  }, [wechatCode]);

  const onLoginModalClose = useCallback(async () => {
    setLoginModalOpen(false);
    setLoginOkHandlerData(null);
    await loadData();
    shifu.loginTools.emitLoginModalCancel();
  }, [loadData]);

  const onLoginModalOk = useCallback(async () => {
    reloadTree();
    shifu.loginTools.emitLoginModalOk();
    if (loginOkHandlerData) {
      if (loginOkHandlerData.type === 'pay') {
        shifu.payTools.openPay({
          ...loginOkHandlerData.payload,
        });
      }

      setLoginOkHandlerData(null);
    }
  }, [loginOkHandlerData, reloadTree]);

  const onLessonUpdate = useCallback(
    (val) => {
      updateLesson(val.id, val);
    },
    [updateLesson]
  );

  const onChapterUpdate = useCallback(
    ({ id, status, status_value }) => {
      updateChapterStatus(id, { status, status_value });
    },
    [updateChapterStatus]
  );

  const onGoChapter = async (id) => {
    await reloadTree();
    updateChapterId(id);
  };

  const onPurchased = useCallback(() => {
    reloadTree();
  }, [reloadTree]);

  const onGoToSettingBasic = useCallback(() => {
    setUserSettingBasicInfo(true);
    setShowUserSettings(true);
    if (mobileStyle) {
      onNavClose();
    }
  }, [mobileStyle, onNavClose]);

  const onGoToSettingPersonal = useCallback(() => {
    setUserSettingBasicInfo(false);
    setShowUserSettings(true);
    if (mobileStyle) {
      onNavClose();
    }
  }, [mobileStyle, onNavClose]);

  const onLessonSelect = ({ id }) => {
    const chapter = getChapterByLesson(id);
    if (!chapter) {
      return;
    }
    updateLessonId(id);
    if (chapter.id !== chapterId) {
      updateChapterId(chapter.id);
    }

    if (lessonId === id) {
      return;
    }

    events.dispatchEvent(
      new CustomEvent(EVENT_NAMES.GO_TO_NAVIGATION_NODE, {
        detail: {
          chapterId: chapter.id,
          lessonId: id,
        },
      })
    );

    if (mobileStyle) {
      onNavClose();
    }
  };

  const onFeedbackClick = useCallback(() => {
    onFeedbackModalOpen();
  }, [onFeedbackModalOpen]);

  const _onPayModalCancel = useCallback(() => {
    setPayModalOpen(false);
    shifu.payTools.emitPayModalCancel();
  }, []);
  const _onPayModalOk = useCallback(() => {
    setPayModalOpen(false);
    shifu.payTools.emitPayModalOk();
  }, []);

  // check the frame layout
  useEffect(() => {
    const onResize = () => {
      const frameLayout = calcFrameLayout('#root');
      updateFrameLayout(frameLayout);
    };
    window.addEventListener('resize', onResize);
    onResize();
    return () => {
      window.removeEventListener('resize', onResize);
    };
  }, [updateFrameLayout]);

  useEffect(() => {
    const updateCourse = async () => {
      if (courseId) {
        await updateCourseId(courseId);
      }
    };
    updateCourse();
  }, [courseId, updateCourseId]);

  useEffect(() => {
    if (hasCheckLogin) {
      fetchData();
    }
  }, [fetchData, hasCheckLogin]);

  useEffect(() => {
    (async () => {
      if (!hasCheckLogin) {
        await initAndCheckLogin();
      }
    })();
  }, [hasCheckLogin, initAndCheckLogin]);



  // listen global event
  useEffect(() => {
    const resetChapterEventHandler = async (e) => {
      console.log('resetChapterEventHandler', e);
      setLoadedChapterId(null);
      await reloadTree();
      setLoadedChapterId(e.detail.chapter_id);
    };
    const eventHandler = () => {
      setLoginModalOpen(true);
    };

    const payEventHandler = (e) => {
      const { type = '', payload = {} } = e.detail;
      console.log('payEventHandler', type, payload);
      setPayModalState({ type, payload });
      setPayModalOpen(true);
      setLoginOkHandlerData({ type: 'pay', payload: {} });
    };

    shifu.events.addEventListener(
      shifu.EventTypes.OPEN_LOGIN_MODAL,
      eventHandler
    );

    shifu.events.addEventListener(
      shifu.EventTypes.OPEN_PAY_MODAL,
      payEventHandler
    );

    shifu.events.addEventListener(
      shifu.EventTypes.RESET_CHAPTER,
      resetChapterEventHandler
    );

    return () => {
      shifu.events.removeEventListener(
        shifu.EventTypes.OPEN_LOGIN_MODAL,
        eventHandler
      );

      shifu.events.removeEventListener(
        shifu.EventTypes.OPEN_PAY_MODAL,
        payEventHandler
      );

      shifu.events.removeEventListener(
        shifu.EventTypes.RESET_CHAPTER,
        resetChapterEventHandler
      );
    };
  });

  useEffect(() => {
    return useCourseStore.subscribe(
      (state) => state.resetedChapterId,
      (curr) => {
        if (!curr || curr === chapterId) {
          return;
        }
        onGoChapter(curr);
      }
    );
  });

  useEffect(() => {
    console.log('loadData hasCheckLogin', hasCheckLogin);
    if (hasCheckLogin && loadedChapterId !== chapterId) {
      loadData();
      setLoadedChapterId(chapterId);
    }
  }, [chapterId, hasCheckLogin, loadData, loadedChapterId]);

  useEffect(() => {
    setLanguage(i18n.language);
  }, [i18n.language]);

  return (
    <div className={classNames(styles.newChatPage)}>
      <AppContext.Provider
        value={{ frameLayout, mobileStyle, hasLogin, userInfo, theme: '' }}
      >
        <Skeleton
          style={{ width: '100%', height: '100%' }}
          loading={!initialized}
          paragraph={true}
          rows={10}
        >
          {navOpen && (
            <NavDrawer
              courseName={courseName}
              onLoginClick={() => setLoginModalOpen(true)}
              lessonTree={tree}
              selectedLessonId={selectedLessonId}
              onChapterCollapse={toggleCollapse}
              onLessonSelect={onLessonSelect}
              onTryLessonSelect={onTryLessonSelect}
              onClose={onNavClose}
              onBasicInfoClick={onGoToSettingBasic}
              onPersonalInfoClick={onGoToSettingPersonal}
            />
          )}
          {
            <ChatUi
              lessonId={lessonId}
              chapterId={chapterId}
              lessonUpdate={onLessonUpdate}
              onGoChapter={onGoChapter}
              onPurchased={onPurchased}
              showUserSettings={showUserSettings}
              onUserSettingsClose={() => setShowUserSettings(false)}
              chapterUpdate={onChapterUpdate}
              userSettingBasicInfo={userSettingBasicInfo}
              updateSelectedLesson={updateSelectedLesson}
            />
          }
        </Skeleton>
        {loginModalOpen && (
          <LoginModal
            onLogin={onLoginModalOk}
            open={loginModalOpen}
            onClose={onLoginModalClose}
            destroyOnClose={true}
            onFeedbackClick={onFeedbackClick}
          />
        )}
        {payModalOpen &&
          (mobileStyle ? (
            <PayModalM
              open={payModalOpen}
              onCancel={_onPayModalCancel}
              onOk={_onPayModalOk}
              type={payModalState.type}
              payload={payModalState.payload}
            />
          ) : (
            <PayModal
              open={payModalOpen}
              onCancel={_onPayModalCancel}
              onOk={_onPayModalOk}
              type={payModalState.type}
              payload={payModalState.payload}
            />
          ))}
        {initialized && <TrackingVisit />}

        {mobileStyle && (
          <ChatMobileHeader
            navOpen={navOpen}
            className={styles.chatMobileHeader}
            iconPopoverPayload={tree?.bannerInfo}
            onSettingClick={onNavToggle}
          />
        )}

        <FeedbackModal
          open={feedbackModalOpen}
          onClose={onFeedbackModalClose}
        />
      </AppContext.Provider>
    </div>
  );
};

export default NewChatPage;
