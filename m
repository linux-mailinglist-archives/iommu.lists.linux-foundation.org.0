Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1716737798B
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 02:45:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B774041E;
	Mon, 10 May 2021 00:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqzBttB7ilAE; Mon, 10 May 2021 00:45:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B09A4053D;
	Mon, 10 May 2021 00:45:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 277B2C0024;
	Mon, 10 May 2021 00:45:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85ABCC0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 00:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C08540179
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 00:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4InyLNCyv1e8 for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 00:45:15 +0000 (UTC)
X-Greylist: delayed 00:32:46 by SQLgrey-1.8.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1DC140167
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 00:45:15 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lftX4-00085c-Uk; Mon, 10 May 2021 02:12:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: xxm@rock-chips.com, robh+dt@kernel.org, will@kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org
Subject: Re: (subset) [PATCH v4 0/6] Add IOMMU driver for rk356x
Date: Mon, 10 May 2021 02:12:20 +0200
Message-Id: <162060552750.1271206.175954480906958099.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210507090232.233049-1-benjamin.gaignard@collabora.com>
References: <20210507090232.233049-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, kernel@collabora.com,
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

On Fri, 7 May 2021 11:02:26 +0200, Benjamin Gaignard wrote:
> This series adds the IOMMU driver for rk356x SoC.
> Since a new compatible is needed to distinguish this second version of
> IOMMU hardware block from the first one, it is an opportunity to convert
> the binding to DT schema.
> 
> version 4:
>  - Add description for reg items
>  - Remove useless interrupt-names properties
>  - Add description for interrupts items
>  - Remove interrupt-names properties from DST files
> 
> [...]

Applied, thanks!

[3/6] ARM: dts: rockchip: rk322x: Fix IOMMU nodes properties
      commit: 6b023929666f0be5df75f5e0278d1b70effadf42
[4/6] ARM: dts: rockchip: rk3036: Remove useless interrupt-names on IOMMU node
      commit: 304b8fbc950bae102f29ee1e8e8557f2fd08d69a
[5/6] ARM64: dts: rockchip: rk3036: Remove useless interrupt-names properties
      commit: 2bf375982f4a58a95e8b5184565b23677900012c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
