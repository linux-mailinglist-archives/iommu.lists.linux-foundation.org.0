Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CE327B75D
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 00:13:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85AF284E38;
	Mon, 28 Sep 2020 22:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0p7irmSf+ga; Mon, 28 Sep 2020 22:13:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8D0084E66;
	Mon, 28 Sep 2020 22:13:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95F42C0051;
	Mon, 28 Sep 2020 22:13:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF599C0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D3BC984627
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKpiaIZSfA-C for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 22:13:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 43C18842EA
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:13:34 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48AD6235F7;
 Mon, 28 Sep 2020 22:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601331214;
 bh=hnIsyOgSNTmnedkbmmONmFzwOC6X92QvwikpZlRdq2Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h8nnBBMOUNJq4pvSzCqtjq7+kecOh37v8UUxD1VqIEO9btiiBq1aitxIxMHk38zJF
 aA8/OXubvZZrTGkvdbxEUbptSaoTwsx/wdpeNkMct6vtI134pYPriwoQ1UQko8veIF
 536KaS7LUXT6a6faQ0ss3WtZa64tRnkYyWaeOhJQ=
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add rmb after reading event queue
 prod_reg
Date: Mon, 28 Sep 2020 23:13:22 +0100
Message-Id: <160132830305.1858738.13352352759100546799.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1601281922-117296-1-git-send-email-wangzhou1@hisilicon.com>
References: <1601281922-117296-1-git-send-email-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 28 Sep 2020 16:32:02 +0800, Zhou Wang wrote:
> In arm_smmu_evtq_thread, reading event queue is from consumer pointer,
> which has no address dependency on producer pointer, prog_reg(MMIO) and
> event queue memory(Normal memory) can disorder. So the load for event queue
> can be done before the load of prod_reg, then perhaps wrong event entry
> value will be got.
> 
> Add rmb to make sure to get correct event queue entry value.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Add rmb after reading event queue prod_reg
      https://git.kernel.org/will/c/a76a37777f2c 

(please note that I changed the patch to use readl() instead of an rmb()
in conjunction with the _relaxed() accessor, and then adjusted the cons
side to match in terms of DMB vs DSB).

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
