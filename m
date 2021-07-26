Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A73D66E2
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 20:44:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E91FB82C04;
	Mon, 26 Jul 2021 18:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVseHv-ZMiHP; Mon, 26 Jul 2021 18:44:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3255D82D12;
	Mon, 26 Jul 2021 18:44:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10F86C000E;
	Mon, 26 Jul 2021 18:44:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8480BC000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 18:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66B1682C33
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 18:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCEthxUjwhX1 for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 18:43:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C54B82C04
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 18:43:58 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E049E59F; Mon, 26 Jul 2021 20:43:52 +0200 (CEST)
Date: Mon, 26 Jul 2021 20:43:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 16/23] iommu/arm-smmu: Prepare for multiple DMA domain
 types
Message-ID: <YP8CUAl0IDO3wOhx@8bytes.org>
References: <cover.1626888444.git.robin.murphy@arm.com>
 <04220b3420c2c513490450f37de109182364f235.1626888445.git.robin.murphy@arm.com>
 <YP6ukfewNVjgS/bt@8bytes.org>
 <a0689d30-2214-c92e-8387-8f1d3b22909b@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0689d30-2214-c92e-8387-8f1d3b22909b@arm.com>
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, will@kernel.org,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, Jul 26, 2021 at 02:09:00PM +0100, Robin Murphy wrote:
> Ha, I had exactly that at one point, except I think in the order of
> iommu_is_dma_domain() :)

That name is fine too :)

> The end result didn't seem to give enough extra clarity to justify the
> header churn for me, but I'm happy to be wrong about that if you prefer.

Developers look more into the code than into headers, so I think the
header churn is worth it to improve code readability. But we can do that
on-top of these changes in an extra patch-set which also introduces
helpers for other domain types (if it is worth it).

Regards,

	J=F6rg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
