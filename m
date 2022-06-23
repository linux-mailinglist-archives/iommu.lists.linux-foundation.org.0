Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7F557512
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 10:12:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C80E060E66;
	Thu, 23 Jun 2022 08:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C80E060E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bvx_HiawiW_9; Thu, 23 Jun 2022 08:12:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E875160E45;
	Thu, 23 Jun 2022 08:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E875160E45
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8D75C007E;
	Thu, 23 Jun 2022 08:12:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56E32C002D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 08:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B6944055F
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 08:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B6944055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m53VipsxzC7T for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 08:12:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E5654055A
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E5654055A
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 08:12:17 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6BAFD447; Thu, 23 Jun 2022 10:12:15 +0200 (CEST)
Date: Thu, 23 Jun 2022 10:12:13 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v1 7/7] iommu/amd: Introduce amd_iommu_pgtable
 command-line option
Message-ID: <YrQgXfPWjsHvQLij@8bytes.org>
References: <20220603112107.8603-1-vasant.hegde@amd.com>
 <20220603112107.8603-8-vasant.hegde@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603112107.8603-8-vasant.hegde@amd.com>
Cc: iommu@lists.linux-foundation.org
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

On Fri, Jun 03, 2022 at 04:51:07PM +0530, Vasant Hegde wrote:
> +	amd_iommu_pgtable= [HW,X86-64]
> +			Specifies one of the following AMD IOMMU page table to
> +			be used for DMA remapping for DMA-API:
> +			v1         - Use v1 page table (Default)
> +			v2         - Use v2 page table
> +

Can we handle this somehow in the amd_iommu= option? Something like
amd_iommu=pgtbl_v2|pgtbl_v1?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
