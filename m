Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F43887CF
	for <lists.iommu@lfdr.de>; Wed, 19 May 2021 08:52:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C0D60657;
	Wed, 19 May 2021 06:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzEZRv9tbzwG; Wed, 19 May 2021 06:52:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id A741D6065C;
	Wed, 19 May 2021 06:52:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C8ACC001C;
	Wed, 19 May 2021 06:52:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 410B4C0001
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 06:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34F2760657
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 06:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPhjbMifBOub for <iommu@lists.linux-foundation.org>;
 Wed, 19 May 2021 06:52:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8340860650
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 06:52:29 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D3A4F2FA; Wed, 19 May 2021 08:52:25 +0200 (CEST)
Date: Wed, 19 May 2021 08:52:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/2] [PULL REQUEST] iommu/vt-d: Fixes for v5.13-rc3
Message-ID: <YKS1o66HBVDv1Nyg@8bytes.org>
References: <20210519015027.108468-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519015027.108468-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org, Dan Carpenter <dan.carpenter@oracle.com>
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

On Wed, May 19, 2021 at 09:50:25AM +0800, Lu Baolu wrote:
> Hi Joerg,
> 
> Two small fixes are queued in this series. It includes:
> 
>  - Use user privilege for RID2PASID translation
>  - Check memory allocation return value
> 
> Please consider them for v5.13.
> 
> Best regards,
> Lu Baolu
> 
> Dan Carpenter (1):
>   iommu/vt-d: Check for allocation failure in aux_detach_device()
> 
> Lu Baolu (1):
>   iommu/vt-d: Use user privilege for RID2PASID translation

Applied for v5.13, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
