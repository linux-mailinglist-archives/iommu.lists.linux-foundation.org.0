Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E29DB77
	for <lists.iommu@lfdr.de>; Tue, 27 Aug 2019 04:00:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 266DFECD;
	Tue, 27 Aug 2019 02:00:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5AFB9EC4
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 02:00:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1438C1FB
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 02:00:45 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 91CAC206E0;
	Tue, 27 Aug 2019 02:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566871244;
	bh=MD3sr2OAksfs0NgAVZIyjzyTAVQ933/C4tnk/zWmHvo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KKAmz9jBCgs55lt1JUWBC6wEihVGwH2eJlWekUmiAHQlHNBSQ9hfI35tKDoisVQk6
	HdBs2Y5wtgaFrBcGW2ON8fxbhdkD/NliHsyJGMXn19bSPectvaDItTx5pd6wjJ55wT
	z4Yn1Rc/2GZC8jtdzkMH5LcPSQD5Mrc/P1BiAwfU=
Date: Mon, 26 Aug 2019 19:00:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
Subject: Re: swiotlb-xen cleanups
In-Reply-To: <20190816130013.31154-1-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908261859490.3428@sstabellini-ThinkPad-T480s>
References: <20190816130013.31154-1-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
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

On Fri, 16 Aug 2019, Christoph Hellwig wrote:
> Hi Xen maintainers and friends,
> 
> please take a look at this series that cleans up the parts of swiotlb-xen
> that deal with non-coherent caches.

Hi Christoph,

I just wanted to let you know that your series is on my radar, but I
have been swamped the last few days. I hope to get to it by the end of
the week.

Cheers,

Stefano
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
