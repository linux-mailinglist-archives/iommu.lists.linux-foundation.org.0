Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB69215770
	for <lists.iommu@lfdr.de>; Mon,  6 Jul 2020 14:43:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0772C8665E;
	Mon,  6 Jul 2020 12:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9wY1OkG2jM4; Mon,  6 Jul 2020 12:43:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3EFD58625D;
	Mon,  6 Jul 2020 12:43:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1AD43C016F;
	Mon,  6 Jul 2020 12:43:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 712D9C016F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 12:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5BC5488909
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 12:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eF7X-OdA7taz for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 12:42:56 +0000 (UTC)
X-Greylist: delayed 01:53:25 by SQLgrey-1.7.6
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn
 [202.108.3.167])
 by whitealder.osuosl.org (Postfix) with SMTP id AE3D186A07
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 12:42:55 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([221.219.171.29])
 by sina.com with ESMTP
 id 5F031C4A0001DF25; Mon, 6 Jul 2020 20:42:52 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 649149628812
From: Hillf Danton <hdanton@sina.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [RFC PATCH] vfio: type1: fix kthread use case
Date: Mon,  6 Jul 2020 20:42:40 +0800
Message-Id: <20200706124241.4392-1-hdanton@sina.com>
In-Reply-To: <83a37410-1740-1a50-9d2d-6ad7587b8532@web.de>
References: <20200706104915.11460-1-hdanton@sina.com>
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


On Mon, 6 Jul 2020 13:32:18 +0200 Markus Elfring wrote:
> =E2=80=A6
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -2798,7 +2798,8 @@ static int vfio_iommu_type1_dma_rw_chunk
> =E2=80=A6
> > -	bool kthread =3D current->mm =3D=3D NULL;
> > +	bool kthread =3D current->flags & PF_KTHREAD;
> > +	bool use_mm =3D current->mm =3D=3D NULL;
> =E2=80=A6
> 
> Can it be helpful to convert initialisations for these variables
> into later assignments?

Perhaps. Then it looks like the below.

--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2798,9 +2798,12 @@ static int vfio_iommu_type1_dma_rw_chunk
 	struct mm_struct *mm;
 	unsigned long vaddr;
 	struct vfio_dma *dma;
-	bool kthread = current->mm == NULL;
+	bool kthread;
+	bool use_mm;
 	size_t offset;
 
+	kthread = current->flags & PF_KTHREAD;
+	use_mm = current->mm == NULL;
 	*copied = 0;
 
 	dma = vfio_find_dma(iommu, user_iova, 1);
@@ -2812,11 +2815,10 @@ static int vfio_iommu_type1_dma_rw_chunk
 		return -EPERM;
 
 	mm = get_task_mm(dma->task);
-
 	if (!mm)
 		return -EPERM;
 
-	if (kthread)
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
