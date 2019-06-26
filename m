Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C14D562D6
	for <lists.iommu@lfdr.de>; Wed, 26 Jun 2019 08:58:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 35DA6DC8;
	Wed, 26 Jun 2019 06:58:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 72B45DB2
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 06:58:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 28C5C710
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 06:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V+ll3m8jZz8kYH2YZTJORSAxB5MqsCNsQpFGLfXgRgU=;
	b=F8/W+BEjo+DMjZ10fxLi0+cWS
	xtUbeEhb5iifJv0Evf0bhuuW4IdPmInNLg48WAlFC421DdkcdQSOsQe/b3wRIyd7G/ReH9LjsqMVj
	2ZWm6Lw7B8TsMcl3DCLD5n5Qk5Z0KZnUZ7DCB0H+Yg3c2O0DC7Q9PuBrj8lgxbdP3aqQ2Rfhmggnl
	7u5ZU5IvevqSlQyfrZG6nUf+aJyeLTRb8M2dydT0pM3T1OX5SsAknZ5ddCYnc2IG5G/ptkPymNeR3
	BHVD54GyVIw3S09GwsWpv8+81K9LZRy0T/+r/mxr5/X9vAd4aO4A50yL6rTyh3zGffHYaQ+xg+Nvv
	JsLUueExA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hg1tH-000867-I9; Wed, 26 Jun 2019 06:58:47 +0000
Date: Tue, 25 Jun 2019 23:58:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sathyavathi M <sathya.m@samsung.com>
Subject: Re: CMA in AMD IOMMU driver
Message-ID: <20190626065847.GA14605@infradead.org>
References: <CGME20190626043433epcms5p84b9b6580f6c6444e69b85525863460ea@epcms5p8>
	<20190626043433epcms5p84b9b6580f6c6444e69b85525863460ea@epcms5p8>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626043433epcms5p84b9b6580f6c6444e69b85525863460ea@epcms5p8>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

Toms conversion of the AMD IOMMU driver to use dma-iommu adds CMA
support :)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
