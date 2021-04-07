Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB6356640
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 10:16:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27646400BF;
	Wed,  7 Apr 2021 08:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfArLppN_Cgo; Wed,  7 Apr 2021 08:16:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D16A40227;
	Wed,  7 Apr 2021 08:16:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BDF3C0012;
	Wed,  7 Apr 2021 08:16:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0F85C000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1FFA848A1
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTEylvakpJcl for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 08:16:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51D498489E
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:16:25 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9E4A92A6; Wed,  7 Apr 2021 10:16:23 +0200 (CEST)
Date: Wed, 7 Apr 2021 10:16:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/5] iommu/vt-d: Several misc cleanups
Message-ID: <YG1qVs/koSdaQj1F@8bytes.org>
References: <20210323010600.678627-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323010600.678627-1-baolu.lu@linux.intel.com>
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
 Will Deacon <will@kernel.org>
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

On Tue, Mar 23, 2021 at 09:05:55AM +0800, Lu Baolu wrote:
> Lu Baolu (5):
>   iommu/vt-d: Remove unused dma map/unmap trace events
>   iommu/vt-d: Remove svm_dev_ops
>   iommu/vt-d: Remove SVM_FLAG_PRIVATE_PASID
>   iommu/vt-d: Remove unused function declarations
>   iommu/vt-d: Make unnecessarily global functions static

Applied all, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
