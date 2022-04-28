Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F83512D8A
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 09:58:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CEBC60B97;
	Thu, 28 Apr 2022 07:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id moshYSeJ6I8a; Thu, 28 Apr 2022 07:58:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A880F60B1B;
	Thu, 28 Apr 2022 07:58:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BE7BC0081;
	Thu, 28 Apr 2022 07:58:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D46AC002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 07:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02E760B14
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 07:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1M9BVxpruP-2 for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 07:58:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68C8960AEB
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 07:58:28 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 713A0452; Thu, 28 Apr 2022 09:58:25 +0200 (CEST)
Date: Thu, 28 Apr 2022 09:58:24 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH] iommu/amd: Remove redundant check
Message-ID: <YmpJICbIVGKA4Jna@8bytes.org>
References: <20220314070226.40641-1-vasant.hegde@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220314070226.40641-1-vasant.hegde@amd.com>
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

On Mon, Mar 14, 2022 at 12:32:26PM +0530, Vasant Hegde wrote:
> smatch static checker warning:
>   drivers/iommu/amd/init.c:1989 amd_iommu_init_pci()
>   warn: duplicate check 'ret' (previous on line 1978)
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 06687a03805e ("iommu/amd: Improve error handling for amd_iommu_init_pci")
> Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
