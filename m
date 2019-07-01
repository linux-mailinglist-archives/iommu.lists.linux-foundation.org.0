Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD3EAF1
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 21:35:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B350E2D;
	Mon, 29 Apr 2019 19:35:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 637E9D8D
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 19:35:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EDD47876
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 19:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X4lzX+kb9hozXdpLjDP5xF1q9VeJj9RkW1ampMaw3Z8=;
	b=Vrc7nCcRed5ITfFUEFO6B2eYC
	dNF1BXdkQlXSw2RiJq+2F/xNrMpqubyPnTWodY2Os4ZpdbQsYO/zy/Z/KcCrLzxkC6jBZLCk3auqg
	K2QW9AqqN68EckGzq59tYqnK2+l2RsEjNM4Jn2YI1P+Fv3+yGl7ho0bb/JdUDeKmKMcHLlRm5ccju
	0mROVq1oX/lwzgDJmqGzHuLvUZHoF0avMV5rs0eoQi1mz1jqIrLDztiFtJ9w3SM3bEAJ7+apILSDR
	0LTcVqB2AFKteYZheAJT8Yg6hYKM5ihOGyFDI8NDWaNH8Yu4qkuAkfkDfHFS5lnFc8/eShikghtb0
	E6p1uWPEg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hLC3k-0005DD-Vc; Mon, 29 Apr 2019 19:35:28 +0000
Date: Mon, 29 Apr 2019 12:35:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 0/7] iommu/dma-iommu: Split iommu_dma_map_msi_msg in
	two parts
Message-ID: <20190429193528.GA14274@infradead.org>
References: <20190429144428.29254-1-julien.grall@arm.com>
	<646d035d-e160-a19d-8c3a-e1935cf691b5@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <646d035d-e160-a19d-8c3a-e1935cf691b5@arm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jason@lakedaemon.net, douliyangs@gmail.com, logang@deltatee.com,
	bigeasy@linutronix.de, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	Julien Grall <julien.grall@arm.com>, miquel.raynal@bootlin.com,
	tglx@linutronix.de, robin.murphy@arm.com, linux-rt-users@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, Apr 29, 2019 at 04:57:20PM +0100, Marc Zyngier wrote:
> Thanks for having reworked this. I'm quite happy with the way this looks
> now (modulo the couple of nits Robin and I mentioned, which I'm to
> address myself).
> 
> Jorg: are you OK with this going via the irq tree?

As-is this has a trivial conflict with my
"implement generic dma_map_ops for IOMMUs" series.  But I can tweak
it a bit to avoid that conflict.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
