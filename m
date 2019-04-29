Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4FFE2A6
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 14:31:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E23222109;
	Mon, 29 Apr 2019 12:31:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 115D620FE
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 12:29:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A800C711
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EW2iFwNqNlht0+s6NLZ+G7rAKMXqi0WCLFnU84fEvkg=;
	b=nygdDVLb/m+CHDFtCRuiQ8nNi
	pUi5ycISG+ucbS2NSkUmrIVLmBPKgPu76P1ik4GSxBXwkDCYul7a5ClBaLMu+K+QFLcKfT2DW2j9h
	8Kp8ijK628X79p4wqr7vZeW9edWMPukUyQN1xxsoVaUpEpOuFHCHxGfytmu2zOPZZFMVaLQ+bg1tx
	gVKDuO7Vz2xZaLlmcjVB2kH7K+gszrqeuM+SvPvuF0cOLk5ewB1yIBWaLyNerv1IKMmWX+xkRS9em
	IYGLimdeSugWxXYmyymg6uUvlP2nDBhNyxndCaeGNQKDS5Wn0M4lhGELi/AUneYCwTtFwt1ceVdss
	S8KuLGR3w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hL5PC-0003U0-Ql; Mon, 29 Apr 2019 12:29:10 +0000
Date: Mon, 29 Apr 2019 05:29:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Tom Murphy <tmurphy@arista.com>
Subject: Re: [PATCH v1] iommu/amd: flush not present cache in iommu_map_page
Message-ID: <20190429122910.GA13153@infradead.org>
References: <20190424165051.13614-1-tmurphy@arista.com>
	<20190426140429.GG24576@8bytes.org>
	<CAPL0++6_Hyozhf+eA2LM=t_Vuq8HaDzcczAUm0S4=DAw4jmMpA@mail.gmail.com>
	<20190429115916.GA5349@infradead.org>
	<CAPL0++7G4zNp76z_8bzV84ky2vXeoX2jTCLSCC-CCWZMgwP5Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPL0++7G4zNp76z_8bzV84ky2vXeoX2jTCLSCC-CCWZMgwP5Pw@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
	iommu@lists.linux-foundation.org
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

On Mon, Apr 29, 2019 at 01:17:44PM +0100, Tom Murphy wrote:
> Yes. My patches depend on the "iommu/vt-d: Delegate DMA domain to
> generic iommu" patch which is currently being reviewed.

Nice!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
