import { Modal } from 'antd-mobile';
import { calModalWidth } from 'Utils/common.js';
import { useUiLayoutStore } from 'stores/useUiLayoutStore.js';
import MainButton from 'Components/MainButton.jsx';
import styles from './SettingBaseModal.module.scss';
import { memo, useContext } from 'react';
import { AppContext } from 'Components/AppContext.js';

export const SettingBaseModal = ({
  open,
  children,
  onOk,
  onClose,
  defaultWidth = '360px',
  title = '设置',
  header = <div className={styles.header}>{title}</div>,
}) => {

  const { mobileStyle } = useContext(AppContext);
  return (
    <Modal
      visible={open}
      onClose={onClose}
      className={styles.SettingBaseModal}
      closeOnMaskClick={true}
      content={
        <div
          style={{ width: calModalWidth({ inMobile: mobileStyle, width: defaultWidth }) }}
          className={styles.modalWrapper}
        >
          {header}
          {children}
          <div className={styles.btnWrapper}>
            <MainButton width="100%" onClick={onOk}>
              确定
            </MainButton>
          </div>
        </div>
      }
    ></Modal>
  );
};

export default memo(SettingBaseModal);
