Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A0239FE4
	for <lists.iommu@lfdr.de>; Mon,  3 Aug 2020 08:57:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C9A46868B0;
	Mon,  3 Aug 2020 06:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0si5ewBltNd0; Mon,  3 Aug 2020 06:57:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 985A186777;
	Mon,  3 Aug 2020 06:57:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75969C004C;
	Mon,  3 Aug 2020 06:57:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D7F6C004C;
 Mon,  3 Aug 2020 06:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37FA185522;
 Mon,  3 Aug 2020 06:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTaJ1kClqTte; Mon,  3 Aug 2020 06:57:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4D1CB854E5;
 Mon,  3 Aug 2020 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S81Y7/E/1KRByHOMFTAO1WQMOll7HWoP+pv/fCo/3sI=; b=Imiqwh2wh6gfO95HVgGWdIpJ7R
 qFqJDaURIpsOiDpUCq2k3ILdHp9/G64PbhflfbfwXUHR3YCqdMM2JIr5p2HV5QlEFNjYcibq1cAwB
 k5jcDFqNUiYh1ErghhsIpsN5baKyFw50AsjkOnyh0RkcQvG4I/FuQV4i+K4smxUlt0gQ8ZINX4zk1
 zqYZrKBpxdTsr3nucjd2JPKqfEkufPqh/aFaSwGu2mFtFylC2a36pyZdPfsQXEbP1+7In5Kkj2kTD
 iIuAdnnH0jCfMh5vNRvgFzTjztCURqfBsmyFjwViAe1IQB++yIvaVvpqhNNNwV/B+lmZFzbHjUNTv
 QTu3Qcmg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k2UOb-0005Zd-6v; Mon, 03 Aug 2020 06:56:29 +0000
Date: Mon, 3 Aug 2020 07:56:29 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC PATCH 00/17] Drop uses of pci_read_config_*() return value
Message-ID: <20200803065629.GA19534@infradead.org>
References: <20200802184648.GA23190@nazgul.tnic>
 <20200802191406.GA248232@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802191406.GA248232@bjorn-Precision-5520>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-rdma@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-atm-general@lists.sourceforge.net, trix@redhat.com,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Wolfgang Grandegger <wg@grandegger.com>, intel-gfx@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 Kalle Valo <kvalo@codeaurora.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Saheed Bolarinwa <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
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

On Sun, Aug 02, 2020 at 02:14:06PM -0500, Bjorn Helgaas wrote:
> But what guarantees that a PCI config register cannot contain ~0?
> If there's something about that in the spec I'd love to know where it
> is because it would simplify a lot of things.

There isn't.  An we even have cases like the NVMe controller memory
buffer and persistent memory region, which are BARs that store
abritrary values for later retreival, so it can't.  (now those
features have a major issue with error detection, but that is another
issue)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
