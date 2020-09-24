Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F0259276E03
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 11:56:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7B1B32E0EB;
	Thu, 24 Sep 2020 09:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x+Q5knpJWiGX; Thu, 24 Sep 2020 09:56:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9297C2E0F1;
	Thu, 24 Sep 2020 09:56:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B0D2C0051;
	Thu, 24 Sep 2020 09:56:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 599BCC0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5265986B2E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5PmDTZ2kyLL for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 09:56:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AA0FD86B05
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:56:32 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id EAE83295; Thu, 24 Sep 2020 11:56:30 +0200 (CEST)
Date: Thu, 24 Sep 2020 11:56:29 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <20200924095629.GL27174@8bytes.org>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Poonam Aggrwal <poonam.aggrwal@nxp.com>, robh@kernel.org,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
 Will Deacon <will@kernel.org>, Zhiqiang.Hou@nxp.com
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

On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote:
> Yes, the issue was introduced by one of the changes in "dma-mapping:
> introduce DMA range map, supplanting dma_pfn_offset", so it only existed in
> the dma-mapping/for-next branch anyway.

Okay, alright then.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
