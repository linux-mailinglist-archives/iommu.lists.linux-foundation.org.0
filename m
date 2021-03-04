Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A432D2ED
	for <lists.iommu@lfdr.de>; Thu,  4 Mar 2021 13:29:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2644EBE1;
	Thu,  4 Mar 2021 12:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxmOR8FRYLYw; Thu,  4 Mar 2021 12:29:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D7E44EBE0;
	Thu,  4 Mar 2021 12:29:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1762AC000F;
	Thu,  4 Mar 2021 12:29:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2149FC0001
 for <iommu@lists.linux-foundation.org>; Thu,  4 Mar 2021 12:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF83184299
 for <iommu@lists.linux-foundation.org>; Thu,  4 Mar 2021 12:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIsgnPVl8v5c for <iommu@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 12:29:26 +0000 (UTC)
X-Greylist: delayed 00:07:51 by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55A6C842A2
 for <iommu@lists.linux-foundation.org>; Thu,  4 Mar 2021 12:29:26 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 342BF22E; Thu,  4 Mar 2021 13:21:33 +0100 (CET)
Date: Thu, 4 Mar 2021 13:21:31 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
Message-ID: <20210304122131.GC26414@8bytes.org>
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210218220702.1962-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: guillaume.tucker@collabora.com, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, will@kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Feb 18, 2021 at 02:07:02PM -0800, Nicolin Chen wrote:
>  drivers/iommu/tegra-smmu.c | 72 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)

Applied for v5.12, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
