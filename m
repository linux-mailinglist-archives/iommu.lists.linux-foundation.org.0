Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F92B644A
	for <lists.iommu@lfdr.de>; Wed, 18 Sep 2019 15:22:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7B352CC6;
	Wed, 18 Sep 2019 13:22:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 13445CAB
	for <iommu@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 13:22:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7687583A
	for <iommu@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 13:22:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CC48268B05; Wed, 18 Sep 2019 15:22:42 +0200 (CEST)
Date: Wed, 18 Sep 2019 15:22:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Subject: Re: [bug] __blk_mq_run_hw_queue suspicious rcu usage
Message-ID: <20190918132242.GA16133@lst.de>
References: <alpine.DEB.2.21.1909041434580.160038@chino.kir.corp.google.com>
	<20190905060627.GA1753@lst.de>
	<alpine.DEB.2.21.1909051534050.245316@chino.kir.corp.google.com>
	<alpine.DEB.2.21.1909161641320.9200@chino.kir.corp.google.com>
	<alpine.DEB.2.21.1909171121300.151243@chino.kir.corp.google.com>
	<1d74607e-37f7-56ca-aba3-5a3bd7a68561@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d74607e-37f7-56ca-aba3-5a3bd7a68561@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jens Axboe <axboe@kernel.dk>, "Singh, Brijesh" <brijesh.singh@amd.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Peter Gonda <pgonda@google.com>, David Rientjes <rientjes@google.com>,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
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

On Tue, Sep 17, 2019 at 06:41:02PM +0000, Lendacky, Thomas wrote:
> > diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> > --- a/drivers/nvme/host/pci.c
> > +++ b/drivers/nvme/host/pci.c
> > @@ -1613,7 +1613,8 @@ static int nvme_alloc_admin_tags(struct nvme_dev *dev)
> >  		dev->admin_tagset.timeout = ADMIN_TIMEOUT;
> >  		dev->admin_tagset.numa_node = dev_to_node(dev->dev);
> >  		dev->admin_tagset.cmd_size = sizeof(struct nvme_iod);
> > -		dev->admin_tagset.flags = BLK_MQ_F_NO_SCHED;
> > +		dev->admin_tagset.flags = BLK_MQ_F_NO_SCHED |
> > +					  BLK_MQ_F_BLOCKING;
> 
> I think you want to only set the BLK_MQ_F_BLOCKING if the DMA is required
> to be unencrypted. Unfortunately, force_dma_unencrypted() can't be called
> from a module. Is there a DMA API that could be called to get that info?

The DMA API must support non-blocking calls, and various drivers rely
on that.  So we need to provide that even for the SEV case.  If the
actual blocking can't be made to work we'll need to wire up the DMA
pool in kernel/dma/remap.c for it (and probably move it to separate
file).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
