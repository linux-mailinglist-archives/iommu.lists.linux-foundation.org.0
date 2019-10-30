Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF9EA312
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 19:12:17 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 73E1BF68;
	Wed, 30 Oct 2019 18:12:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 396FFAD7
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 18:12:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E23B487B
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 18:12:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B551868B05; Wed, 30 Oct 2019 19:12:08 +0100 (CET)
Date: Wed, 30 Oct 2019 19:12:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Shyam Saini <mayhs11saini@gmail.com>
Subject: Re: [PATCH V2] kernel: dma: contigous: Make CMA parameters
	__initdata/__initconst
Message-ID: <20191030181208.GA19513@lst.de>
References: <20191020050322.2634-1-mayhs11saini@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191020050322.2634-1-mayhs11saini@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	iommu@lists.linux-foundation.org, Christopher Lameter <cl@linux.com>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

Applied to the dma-mapping for-next branch after fixing up the commit
message and an overly long line.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
