Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B62964F84E5
	for <lists.iommu@lfdr.de>; Thu,  7 Apr 2022 18:22:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 720B0840C4;
	Thu,  7 Apr 2022 16:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44P3woAGT4te; Thu,  7 Apr 2022 16:22:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 58D7F84039;
	Thu,  7 Apr 2022 16:22:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 346FDC0083;
	Thu,  7 Apr 2022 16:22:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 294BDC0012
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 16:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA55440CCE
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 16:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2y7HpdkPeFBP for <iommu@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 16:22:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54680400FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=rMmDd7FK89WBPMzhI41Yh5OWeVuvzuwCzfQzO0Mz/AU=; b=iG+EidunEVskeYVIo6imRxDh47
 8oq55Yf7ytuhttopUD3lvf6ThM95I2SsX20Tz5UXUkIHMvEUwkiyLww1Y7lHLgPLamVgzzrDt9fYq
 fpg8LyY+HXCPuc+m5seNIMP6THmXjEpPrwBk+domuzL5vo/nJyqtYtFUTbuonua5YFS70T17/tsyO
 Pgfwb6Z8/wqY9TNBk0i3thENlVQAP5CwlZXcgv5Mc/wTHtjxESXLnXBUgGBRbumCU/gpb5+oRv96h
 HcTc43gYK3lYYuIjoveMt+N0WHXfbSbT3dVPExe0nM5REk4BP4aZAir/OaylNhLOLqVjDfa7vIHRS
 cLi8EOWQ==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gunthorp@deltatee.com>)
 id 1ncUMI-002BBf-HJ; Thu, 07 Apr 2022 09:47:43 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1ncUMF-00022U-JJ; Thu, 07 Apr 2022 09:47:39 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
Date: Thu,  7 Apr 2022 09:47:17 -0600
Message-Id: <20220407154717.7695-22-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407154717.7695-1-logang@deltatee.com>
References: <20220407154717.7695-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, sbates@raithlin.com, hch@lst.de,
 jgg@ziepe.ca, christian.koenig@amd.com, ddutile@redhat.com,
 willy@infradead.org, daniel.vetter@ffwll.ch, jason@jlekstrand.net,
 dave.hansen@linux.intel.com, helgaas@kernel.org, dan.j.williams@intel.com,
 andrzej.jakowski@intel.com, dave.b.minturn@intel.com, jianxin.xiong@intel.com,
 ira.weiny@intel.com, robin.murphy@arm.com, martin.oliveira@eideticom.com,
 ckulkarnilinux@gmail.com, jhubbard@nvidia.com, rcampbell@nvidia.com,
 logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v6 21/21] nvme-pci: allow mmaping the CMB in userspace
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Ira Weiny <ira.weiny@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Allow userspace to obtain CMB memory by mmaping the controller's
char device. The mmap call allocates and returns a hunk of CMB memory,
(the offset is ignored) so userspace does not have control over the
address within the CMB.

A VMA allocated in this way will only be usable by drivers that set
FOLL_PCI_P2PDMA when calling GUP. And inter-device support will be
checked the first time the pages are mapped for DMA.

Currently this is only supported by O_DIRECT to an PCI NVMe device
or through the NVMe passthrough IOCTL.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/nvme/host/core.c | 15 +++++++++++++++
 drivers/nvme/host/nvme.h |  2 ++
 drivers/nvme/host/pci.c  | 17 +++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index bbc276dda49f..1fd3372c2c18 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3114,6 +3114,10 @@ static int nvme_dev_open(struct inode *inode, struct file *file)
 	}
 
 	file->private_data = ctrl;
+
+	if (ctrl->ops->cdev_file_open)
+		ctrl->ops->cdev_file_open(ctrl, file);
+
 	return 0;
 }
 
@@ -3127,12 +3131,23 @@ static int nvme_dev_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int nvme_dev_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct nvme_ctrl *ctrl = file->private_data;
+
+	if (!ctrl->ops->mmap_cmb)
+		return -ENODEV;
+
+	return ctrl->ops->mmap_cmb(ctrl, vma);
+}
+
 static const struct file_operations nvme_dev_fops = {
 	.owner		= THIS_MODULE,
 	.open		= nvme_dev_open,
 	.release	= nvme_dev_release,
 	.unlocked_ioctl	= nvme_dev_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
+	.mmap		= nvme_dev_mmap,
 };
 
 static ssize_t nvme_sysfs_reset(struct device *dev,
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 7d97bfb2a9e2..24fbcd274c64 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -497,6 +497,8 @@ struct nvme_ctrl_ops {
 	void (*delete_ctrl)(struct nvme_ctrl *ctrl);
 	int (*get_address)(struct nvme_ctrl *ctrl, char *buf, int size);
 	bool (*supports_pci_p2pdma)(struct nvme_ctrl *ctrl);
+	void (*cdev_file_open)(struct nvme_ctrl *ctrl, struct file *file);
+	int (*mmap_cmb)(struct nvme_ctrl *ctrl, struct vm_area_struct *vma);
 };
 
 /*
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 07412116d4d1..5946244e0295 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2965,6 +2965,21 @@ static bool nvme_pci_supports_pci_p2pdma(struct nvme_ctrl *ctrl)
 	return dma_pci_p2pdma_supported(dev->dev);
 }
 
+static void nvme_pci_cdev_file_open(struct nvme_ctrl *ctrl, struct file *file)
+{
+	struct pci_dev *pdev = to_pci_dev(to_nvme_dev(ctrl)->dev);
+
+	pci_p2pdma_file_open(pdev, file);
+}
+
+static int nvme_pci_mmap_cmb(struct nvme_ctrl *ctrl,
+			     struct vm_area_struct *vma)
+{
+	struct pci_dev *pdev = to_pci_dev(to_nvme_dev(ctrl)->dev);
+
+	return pci_mmap_p2pmem(pdev, vma);
+}
+
 static const struct nvme_ctrl_ops nvme_pci_ctrl_ops = {
 	.name			= "pcie",
 	.module			= THIS_MODULE,
@@ -2976,6 +2991,8 @@ static const struct nvme_ctrl_ops nvme_pci_ctrl_ops = {
 	.submit_async_event	= nvme_pci_submit_async_event,
 	.get_address		= nvme_pci_get_address,
 	.supports_pci_p2pdma	= nvme_pci_supports_pci_p2pdma,
+	.cdev_file_open		= nvme_pci_cdev_file_open,
+	.mmap_cmb		= nvme_pci_mmap_cmb,
 };
 
 static int nvme_dev_map(struct nvme_dev *dev)
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
