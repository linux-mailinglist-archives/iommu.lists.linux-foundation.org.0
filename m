Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC6469592
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 13:20:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF7A1400A4;
	Mon,  6 Dec 2021 12:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tuz42O870OPo; Mon,  6 Dec 2021 12:20:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E6A4640017;
	Mon,  6 Dec 2021 12:20:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98D3AC0071;
	Mon,  6 Dec 2021 12:20:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB130C0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 12:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCA3281CE3
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 12:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLfUswUxpu6J for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 12:20:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4222981815
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 12:20:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D790C396; Mon,  6 Dec 2021 13:20:13 +0100 (CET)
Date: Mon, 6 Dec 2021 13:20:02 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/9] gpu: host1x: Add missing DMA API include
Message-ID: <Ya3/8mlWkBZiGi7m@8bytes.org>
References: <cover.1637671820.git.robin.murphy@arm.com>
 <d7bc49bfda25a7ea19dc574f8e212cd9e42bf2e2.1637671820.git.robin.murphy@arm.com>
 <0dfb2ee7-e6ec-f085-ed16-650e646d24d7@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0dfb2ee7-e6ec-f085-ed16-650e646d24d7@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, willy@infradead.org,
 linux-tegra@vger.kernel.org, will@kernel.org
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

Hi Robin,

On Wed, Nov 24, 2021 at 02:05:15PM +0000, Robin Murphy wrote:
> Bah, seems like tegra-vic needs the same treatment too, but wasn't in my
> local config. Should I squash that into a respin of this patch on the
> grounds of being vaguely related, or would you prefer it separate?

In case this fix gets queued in the iommu-tree too, please put it all in
one patch.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
