Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F2E3DDBAD
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 16:56:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B09836A7;
	Mon,  2 Aug 2021 14:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWjL_7foBjIk; Mon,  2 Aug 2021 14:56:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 84A5F837B6;
	Mon,  2 Aug 2021 14:56:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64A1CC000E;
	Mon,  2 Aug 2021 14:56:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55E10C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 14:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ED7540015
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 14:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Is-5UvmNqtY for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 14:56:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7105B400A4
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 14:56:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1D5CB3C3; Mon,  2 Aug 2021 16:56:26 +0200 (CEST)
Date: Mon, 2 Aug 2021 16:56:20 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/2] Implement [map/unmap]_pages callbacks for ARM SMMUV3
Message-ID: <YQgHlM4lurJzQHo2@8bytes.org>
References: <1627697831-158822-1-git-send-email-chenxiang66@hisilicon.com>
 <20210802144319.GA28735@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802144319.GA28735@willie-the-truck>
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com, linuxarm@huawei.com
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

On Mon, Aug 02, 2021 at 03:43:20PM +0100, Will Deacon wrote:
> For both patches:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Joerg -- please can you take these directly? They build on top of the
> changes from Isaac which you have queued on your 'core' branch.

Sure, applied to core branch now.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
