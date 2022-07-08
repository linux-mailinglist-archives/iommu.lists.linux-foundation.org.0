Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBF56CD71
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4364960E52;
	Sun, 10 Jul 2022 06:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4364960E52
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nqmPCgAc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5C4YzkNK4Gq0; Sun, 10 Jul 2022 06:37:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 307D760E4D;
	Sun, 10 Jul 2022 06:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 307D760E4D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5000FC008A;
	Sun, 10 Jul 2022 06:37:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A8BDC002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2914C425A0
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2914C425A0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=nqmPCgAc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhObGJyQoi8r for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 10:32:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 191C942586
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 191C942586
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:32:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D12E623AA;
 Fri,  8 Jul 2022 10:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB654C341C0;
 Fri,  8 Jul 2022 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657276348;
 bh=e10ZI1CgOPBaCFpRJdOLxaOOZ9pi0B4OTPxlMQOe5II=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nqmPCgAc7DKcfF9VX3D6mfHKo+T8+GiwKIFpPYIQiTpvYpmL2f5gtrnsvCwQ/2WVP
 eMNobFX5Oy/m9CoGXslKTxzsDk7fMB2pit+1Bpr55B6Scg2s2QdqsAmF0Al/BcvQdm
 YRWjX8X3mfdrpGsaaiZpAovIumKNbsMDXP5N4aTwAiUprWFXMPbTaKrY8YRKulQg+u
 y9KWIbHmC5LNISIxcksOiO7rBylgEJh3YAvOZhrHS38yquTfHVq0MpHKv65skji5FB
 pWbPxCwPCnkiJrn8To43r9n6hVY2HW0Hpc/iZSI0NDb3OO5m1ePJe9w9HmUiKJBups
 3ULP0g+zES+rw==
Date: Fri, 8 Jul 2022 11:32:22 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] iommu: remove the put_resv_regions method
Message-ID: <20220708103221.GA5744@willie-the-truck>
References: <20220708080616.238833-1-hch@lst.de>
 <20220708080616.238833-4-hch@lst.de>
 <20220708101244.GA5395@willie-the-truck>
 <20220708101951.GA32127@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220708101951.GA32127@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Jul 08, 2022 at 12:19:51PM +0200, Christoph Hellwig wrote:
> On Fri, Jul 08, 2022 at 11:12:45AM +0100, Will Deacon wrote:
> > Heads up, but I think this might collide (trivially?) with:
> > 
> > https://lore.kernel.org/r/20220615101044.1972-1-shameerali.kolothum.thodi@huawei.com
> > 
> > which Joerg has queued up already. It looks like the cleanup still makes
> > sense though, so that's good.
> 
> This series sits on top of that one - I waited for it to hit the IOMMU
> tree before resending to avoid the conflict.

Ah brill, sorry for the noise.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
