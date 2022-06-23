Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E29955754F
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 10:24:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0BF561360;
	Thu, 23 Jun 2022 08:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0BF561360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ULYTdpJdElB; Thu, 23 Jun 2022 08:24:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 01DDA60E66;
	Thu, 23 Jun 2022 08:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01DDA60E66
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B814BC007E;
	Thu, 23 Jun 2022 08:24:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF9D9C002D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 08:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBE2160E66
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 08:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBE2160E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4bwfoeJXG4j for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 08:24:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AACA60E45
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AACA60E45
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 08:24:00 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4EBD2447; Thu, 23 Jun 2022 10:23:58 +0200 (CEST)
Date: Thu, 23 Jun 2022 10:23:57 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v3 7/7] iommu/amd: Do not support IOMMUv2 APIs when SNP
 is enabled
Message-ID: <YrQjHYsEIGN0mtO2@8bytes.org>
References: <20220622171131.11870-1-suravee.suthikulpanit@amd.com>
 <20220622171131.11870-8-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622171131.11870-8-suravee.suthikulpanit@amd.com>
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, linux-kernel@vger.kernel.org,
 vasant.hegde@amd.com, iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

On Wed, Jun 22, 2022 at 12:11:31PM -0500, Suravee Suthikulpanit wrote:
>  bool amd_iommu_v2_supported(void)
>  {
> -	return amd_iommu_v2_present;
> +	/*
> +	 * Since DTE[Mode]=0 is prohibited on SNP-enabled system
> +	 * (i.e. EFR[SNPSup]=1), IOMMUv2 page table cannot be used without
> +	 * setting up IOMMUv1 page table.
> +	 */
> +	return amd_iommu_v2_present && !amd_iommu_snp_en;

IOMMU_v2 APIs could actually be supported with GIOV and IOMMUv2
page-tables in-use, no?

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
