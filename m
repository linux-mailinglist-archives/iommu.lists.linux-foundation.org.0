Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2E9215926
	for <lists.iommu@lfdr.de>; Mon,  6 Jul 2020 16:08:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C59332601D;
	Mon,  6 Jul 2020 14:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RX2RNyNefprM; Mon,  6 Jul 2020 14:08:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 36E0925FA7;
	Mon,  6 Jul 2020 14:08:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C1C2C016F;
	Mon,  6 Jul 2020 14:08:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0AA2C016F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 14:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9C7D187700
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 14:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ljJ1orc-1Ro for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 14:08:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
 [202.108.3.166])
 by fraxinus.osuosl.org (Postfix) with SMTP id EDC91876F8
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 14:08:23 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([221.219.171.29])
 by sina.com with ESMTP
 id 5F0330510000077E; Mon, 6 Jul 2020 22:08:20 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 2017854919597
From: Hillf Danton <hdanton@sina.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [RFC PATCH] vfio: type1: fix kthread use case
Date: Mon,  6 Jul 2020 22:08:06 +0800
Message-Id: <20200706140806.6028-1-hdanton@sina.com>
In-Reply-To: <7ed25c44-bb51-2d8d-82d9-f11272f56424@web.de>
References: <20200706104915.11460-1-hdanton@sina.com>
 <20200706124241.4392-1-hdanton@sina.com>
MIME-Version: 1.0
Cc: Hillf Danton <hdanton@sina.com>, Yan Zhao <yan.y.zhao@intel.com>,
 kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Christoph Hellwig <hch@lst.de>
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


On Mon, 6 Jul 2020 15:33:58 +0200 Markus Elfring wrote:
>
> I would prefer the following variable declarations then.
> 
> +	bool kthread, use_mm;
> 
> 
> >  	size_t offset;
> >
> > +	kthread =3D current->flags & PF_KTHREAD;
> > +	use_mm =3D current->mm =3D=3D NULL;
> 
> I propose to move such assignments directly before the corresponding check=
> .

Got it. See below.

> 
> >  	if (!mm)
> >  		return -EPERM;
> 
> 
> +	kthread =3D current->flags & PF_KTHREAD;
> +	use_mm =3D !current->mm;
> 
> > -	if (kthread)
> > +	if (kthread && use_mm)
> >  		kthread_use_mm(mm);


--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2798,7 +2798,7 @@ static int vfio_iommu_type1_dma_rw_chunk
 	struct mm_struct *mm;
 	unsigned long vaddr;
 	struct vfio_dma *dma;
-	bool kthread = current->mm == NULL;
+	bool kthread, use_mm;
 	size_t offset;
 
 	*copied = 0;
@@ -2812,11 +2812,13 @@ static int vfio_iommu_type1_dma_rw_chunk
 		return -EPERM;
 
 	mm = get_task_mm(dma->task);
-
 	if (!mm)
 		return -EPERM;
 
-	if (kthread)
+	kthread = current->flags & PF_KTHREAD;
+	use_mm = current->mm == NULL;
+
+	if (kthread && use_mm)
 		kthread_use_mm(mm);
 	else if (current->mm != mm)
 		goto out;
@@ -2843,7 +2845,7 @@ static int vfio_iommu_type1_dma_rw_chunk
 	} else
 		*copied = copy_from_user(data, (void __user *)vaddr,
 					   count) ? 0 : count;
-	if (kthread)
+	if (kthread && use_mm)
 		kthread_unuse_mm(mm);
 out:
 	mmput(mm);

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
