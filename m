Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086B21E7C7
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 08:01:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BEF918B03B;
	Tue, 14 Jul 2020 06:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GlruWDMxcXob; Tue, 14 Jul 2020 06:01:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 651F28B037;
	Tue, 14 Jul 2020 06:01:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D805C0888;
	Tue, 14 Jul 2020 06:01:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22679C0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DFAD58A6D2
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKqqAVvlHrHb for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 06:01:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 139B48A6CF
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:50 +0000 (UTC)
IronPort-SDR: tn02W+USHPNhMyIXhZPvCqPmQqxtVcHDyo1ittlIUW2iQ5sVSPBqNDAc8Ip9lYfsqykv08++2v
 otE7/tUHU+Hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="147947565"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="147947565"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 23:01:49 -0700
IronPort-SDR: u2rOXLUD4zPX7KeVSUbGaRpkDi/6hY+rBkZZg12ehlSof92QkBVN7lmLGCwb1fPoEpQbnumjwn
 6h6Xv+RtzM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="324450162"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2020 23:01:46 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v3 0/4] iommu aux-domain APIs extensions
Date: Tue, 14 Jul 2020 13:56:59 +0800
Message-Id: <20200714055703.5510-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This series aims to extend the IOMMU aux-domain API set so that it
could be more friendly to vfio/mdev usage. The interactions between
vfio/mdev and iommu during mdev creation and passthr are:

1. Create a group for mdev with iommu_group_alloc();
2. Add the device to the group with

       group = iommu_group_alloc();
       if (IS_ERR(group))
               return PTR_ERR(group);

       ret = iommu_group_add_device(group, &mdev->dev);
       if (!ret)
               dev_info(&mdev->dev, "MDEV: group_id = %d\n",
                        iommu_group_id(group));

3. Allocate an aux-domain with iommu_domain_alloc();
4. Attach the aux-domain to the iommu_group.

       iommu_group_for_each_dev {
               if (iommu_dev_feature_enabled(iommu_device, IOMMU_DEV_FEAT_AUX))
                       return iommu_aux_attach_device(domain, iommu_device);
               else
                       return iommu_attach_device(domain, iommu_device);
        }

   where, iommu_device is the aux-domain-capable device. The mdev's in
   the group are all derived from it.

In the whole process, an iommu group was allocated for the mdev and an
iommu domain was attached to the group, but the group->domain leaves
NULL. As the result, iommu_get_domain_for_dev() (or other similar
interfaces) doesn't work anymore.

The iommu_get_domain_for_dev() is a necessary interface for device
drivers that want to support vfio/mdev based aux-domain. For example,

        unsigned long pasid;
        struct iommu_domain *domain;
        struct device *dev = mdev_dev(mdev);
        struct device *iommu_device = vfio_mdev_get_iommu_device(dev);

        domain = iommu_get_domain_for_dev(dev);
        if (!domain)
                return -ENODEV;

        pasid = iommu_aux_get_pasid(domain, iommu_device);
        if (pasid <= 0)
                return -EINVAL;

         /* Program the device context */
         ....

We tried to address this by extending iommu_aux_at(de)tach_device() so that
the users could pass in an optional device pointer (for example vfio/mdev).
(v2 of this series)

https://lore.kernel.org/linux-iommu/20200707013957.23672-1-baolu.lu@linux.intel.com/

But that will cause a lock issue as group->mutex has been applied in
iommu_group_for_each_dev(), but has to be reapplied again in the
iommu_aux_attach_device().

This version tries to address this by introducing two new APIs into the
aux-domain API set:

/**
 * iommu_aux_attach_group - attach an aux-domain to an iommu_group which
 *                          contains sub-devices (for example mdevs)
 *                          derived from @dev.
 * @domain: an aux-domain;
 * @group:  an iommu_group which contains sub-devices derived from @dev;
 * @dev:    the physical device which supports IOMMU_DEV_FEAT_AUX.
 *
 * Returns 0 on success, or an error value.
 */
int iommu_aux_attach_group(struct iommu_domain *domain,
                           struct iommu_group *group, struct device *dev)

/**
 * iommu_aux_detach_group - detach an aux-domain from an iommu_group
 *
 * @domain: an aux-domain;
 * @group:  an iommu_group which contains sub-devices derived from @dev;
 * @dev:    the physical device which supports IOMMU_DEV_FEAT_AUX.
 *
 * @domain must have been attached to @group via
 * iommu_aux_attach_group().
 */
void iommu_aux_detach_group(struct iommu_domain *domain,
                            struct iommu_group *group, struct device *dev)

This version is evolved according to feedbacks from Robin(v1) and
Alex(v2). Your comments are very appreciated.

Best regards,
baolu

---
Change log:
 - v1->v2:
   - https://lore.kernel.org/linux-iommu/20200627031532.28046-1-baolu.lu@linux.intel.com/
   - Suggested by Robin.

 - v2->v3:
   - https://lore.kernel.org/linux-iommu/20200707013957.23672-1-baolu.lu@linux.intel.com/
   - Suggested by Alex

Lu Baolu (4):
  iommu: Check IOMMU_DEV_FEAT_AUX feature in aux api's
  iommu: Add iommu_aux_at(de)tach_group()
  iommu: Add iommu_aux_get_domain_for_dev()
  vfio/type1: Use iommu_aux_at(de)tach_group() APIs

 drivers/iommu/iommu.c           | 92 ++++++++++++++++++++++++++++++---
 drivers/vfio/vfio_iommu_type1.c | 44 +++-------------
 include/linux/iommu.h           | 24 +++++++++
 3 files changed, 116 insertions(+), 44 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
