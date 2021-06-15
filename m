Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C853A8872
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 20:21:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0F34400F3;
	Tue, 15 Jun 2021 18:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id diy13jhAZb-J; Tue, 15 Jun 2021 18:21:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 210DF4015C;
	Tue, 15 Jun 2021 18:21:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8AB6C0011;
	Tue, 15 Jun 2021 18:21:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BA28C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 18:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94BFA608C2
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 18:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55WgdMyAjAsC for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 18:21:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34B11607BC
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 18:21:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE9E6610CD;
 Tue, 15 Jun 2021 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623781300;
 bh=SzyNItewNDf3JLfbNaHGlLNTLLwcqD7llt2uApYwFsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p0dXbmARm2inTC1UzBTVZL0vHWS1a7A8WbWw5Ya+27l1H/AVxTX/AIUi8BNa2m69S
 WldU9ZaDX171o/gB051qQ6RYH6l3R5QoMEvO39E8xySUu+8rbSZA58KJktl2Kydm+0
 Ib5HqF2tEQmKvQoRWiQVGghg2pqwlk0Gc/ZlMQchF7PnelhopV3rLUdX64WF6z8yzP
 OXPLyHlbMxxfXE+ZMol8ZfV4RvHEaQY1GLEsRHREhGsms+hkI98ImehNq/tQ27X3z1
 w4PHNaztggl49onc3oECs14PoZF8XmiU4ZYXVpVhKKqLOx77QVBnj7IPXYvCB9blnb
 cVAsZBHbBhvYg==
Date: Tue, 15 Jun 2021 19:21:35 +0100
From: Will Deacon <will@kernel.org>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v3 3/9] iommu/arm-smmu: Implement ->probe_finalize()
Message-ID: <20210615182135.GA21481@willie-the-truck>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <20210603164632.1000458-4-thierry.reding@gmail.com>
 <CGME20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778@eucas1p2.samsung.com>
 <46e65ade-49cb-5437-5863-1f11ccc2205e@samsung.com>
 <BY5PR12MB376468558EB3330D64758210B3309@BY5PR12MB3764.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR12MB376468558EB3330D64758210B3309@BY5PR12MB3764.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Tue, Jun 15, 2021 at 06:12:13PM +0000, Krishna Reddy wrote:
> > if (smmu->impl->probe_finalize)
> 
> The above is the issue. It should be updated as below similar to other instances impl callbacks.
> if (smmu->impl && smmu->impl->probe_finalize)

I'll push a patch on top shortly...

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
