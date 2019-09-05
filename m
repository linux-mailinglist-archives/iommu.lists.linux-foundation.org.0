Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ED093A9A5D
	for <lists.iommu@lfdr.de>; Thu,  5 Sep 2019 08:06:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 28C59D8D;
	Thu,  5 Sep 2019 06:06:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4479149F
	for <iommu@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 06:06:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 523D8A9
	for <iommu@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 06:06:33 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 27DF868AFE; Thu,  5 Sep 2019 08:06:28 +0200 (CEST)
Date: Thu, 5 Sep 2019 08:06:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [bug] __blk_mq_run_hw_queue suspicious rcu usage
Message-ID: <20190905060627.GA1753@lst.de>
References: <alpine.DEB.2.21.1909041434580.160038@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909041434580.160038@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jens Axboe <axboe@kernel.dk>, Tom Lendacky <thomas.lendacky@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	iommu@lists.linux-foundation.org,
	Peter Gonda <pgonda@google.com>, Christoph Hellwig <hch@lst.de>,
	Jianxiong Gao <jxgao@google.com>
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

On Wed, Sep 04, 2019 at 02:40:44PM -0700, David Rientjes wrote:
> Hi Christoph, Jens, and Ming,
> 
> While booting a 5.2 SEV-enabled guest we have encountered the following 
> WARNING that is followed up by a BUG because we are in atomic context 
> while trying to call set_memory_decrypted:

Well, this really is a x86 / DMA API issue unfortunately.  Drivers
are allowed to do GFP_ATOMIC dma allocation under locks / rcu critical
sections and from interrupts.  And it seems like the SEV case can't
handle that.  We have some semi-generic code to have a fixed sized
pool in kernel/dma for non-coherent platforms that have similar issues
that we could try to wire up, but I wonder if there is a better way
to handle the issue, so I've added Tom and the x86 maintainers.

Now independent of that issue using DMA coherent memory for the nvme
PRPs/SGLs doesn't actually feel very optional.  We could do with
normal kmalloc allocations and just sync it to the device and back.
I wonder if we should create some general mempool-like helpers for that.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
