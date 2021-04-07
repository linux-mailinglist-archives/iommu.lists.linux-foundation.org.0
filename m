Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E53566BA
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 10:24:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D74340630;
	Wed,  7 Apr 2021 08:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LxwzeGzU3-3; Wed,  7 Apr 2021 08:24:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 820A640616;
	Wed,  7 Apr 2021 08:24:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DB81C0012;
	Wed,  7 Apr 2021 08:24:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D56FC000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA50D40209
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdkWVJ7rZi4t for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 08:24:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 546DB400BF
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:24:26 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 46D0D2A6; Wed,  7 Apr 2021 10:24:24 +0200 (CEST)
Date: Wed, 7 Apr 2021 10:24:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu: Fix a boundary issue to avoid performance drop
Message-ID: <YG1sNonlGdV6IdQH@8bytes.org>
References: <1616643504-120688-1-git-send-email-chenxiang66@hisilicon.com>
 <20210325094344.GB14042@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325094344.GB14042@willie-the-truck>
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linuxarm@openeuler.org
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

On Thu, Mar 25, 2021 at 09:43:45AM +0000, Will Deacon wrote:
> Urgh, I must say I much preferred these things being exclusive, but this
> looks like a necessary fix:
> 
> Acked-by: Will Deacon <will@kernel.org>

Applied for v5.12.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
