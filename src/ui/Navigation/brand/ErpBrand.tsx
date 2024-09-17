'use client';
import styles from './brand.module.css';
import { ImMakeGroup } from "react-icons/im";

const ErpBrand = () => {
    return (
        <div className={styles.logoBrand}>
            <span>ERP</span>
            <ImMakeGroup
                className={styles.logo} />
            <span>Facture</span>
        </div>
    );
}
export default ErpBrand;
