Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB42D0E9C
	for <lists.iommu@lfdr.de>; Mon,  7 Dec 2020 12:05:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C5C287159;
	Mon,  7 Dec 2020 11:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LodAuRSPXO8J; Mon,  7 Dec 2020 11:05:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E93A8713D;
	Mon,  7 Dec 2020 11:05:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98D2AC013B;
	Mon,  7 Dec 2020 11:05:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE28FC013B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D7E47861A2
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id niuKqkmXapbD for <iommu@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 11:05:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B4AFB861B3
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:05:33 +0000 (UTC)
From: Will Deacon <will@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Yong Wu <yong.wu@mediatek.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2] iommu: Improve the performance for direct_mapping
Date: Mon,  7 Dec 2020 11:05:24 +0000
Message-Id: <160733817514.2997477.1549939879163904100.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207093553.8635-1-yong.wu@mediatek.com>
References: <20201207093553.8635-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, catalin.marinas@arm.com,
 iommu@lists.linux-foundation.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, chao.hao@mediatek.com,
 Will Deacon <will@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel-team@android.com,
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

On Mon, 7 Dec 2020 17:35:53 +0800, Yong Wu wrote:
> Currently direct_mapping always use the smallest pgsize which is SZ_4K
> normally to mapping. This is unnecessary. we could gather the size, and
> call iommu_map then, iommu_map could decide how to map better with the
> just right pgsize.
> 
> >From the original comment, we should take care overlap, otherwise,
> iommu_map may return -EEXIST. In this overlap case, we should map the
> previous region before overlap firstly. then map the left part.
> 
> [...]

Applied to arm64 (for-next/iommu/misc), thanks!

[1/1] iommu: Improve the performance for direct_mapping
      https://git.kernel.org/arm64/c/093b32a849b3

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
