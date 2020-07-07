Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C42216694
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 08:41:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A95E867DF;
	Tue,  7 Jul 2020 06:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCiVg0ZRspCz; Tue,  7 Jul 2020 06:41:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BFCA28675F;
	Tue,  7 Jul 2020 06:41:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FAFEC08A5;
	Tue,  7 Jul 2020 06:41:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E13EC016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 06:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1582687846
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 06:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qsu9IlFDjj6m for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 06:41:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C9A4386F0A
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 06:41:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8D51F68AFE; Tue,  7 Jul 2020 08:41:22 +0200 (CEST)
Date: Tue, 7 Jul 2020 08:41:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag
Message-ID: <20200707064122.GA23444@lst.de>
References: <20200703162548.19953-1-will@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703162548.19953-1-will@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Fri, Jul 03, 2020 at 05:25:48PM +0100, Will Deacon wrote:
> The IOMMU_SYS_CACHE_ONLY flag was never exposed via the DMA API and
> has no in-tree users. Remove it.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
