Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8429A63D
	for <lists.iommu@lfdr.de>; Tue, 27 Oct 2020 09:11:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E49F866DA;
	Tue, 27 Oct 2020 08:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5at0odpFJBb; Tue, 27 Oct 2020 08:11:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B1F5866D3;
	Tue, 27 Oct 2020 08:11:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7123DC0051;
	Tue, 27 Oct 2020 08:11:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 942FCC0051
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 08:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 79A76866D1
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 08:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JCWRWkpvZsnt for <iommu@lists.linux-foundation.org>;
 Tue, 27 Oct 2020 08:11:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 24CC8866BA
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 08:11:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C9A7967373; Tue, 27 Oct 2020 09:11:03 +0100 (CET)
Date: Tue, 27 Oct 2020 09:11:03 +0100
From: "hch@lst.de" <hch@lst.de>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: WARNING in dma_map_page_attrs
Message-ID: <20201027081103.GA22877@lst.de>
References: <000000000000335adc05b23300f6@google.com>
 <000000000000a0f8a305b261fe4a@google.com>
 <20201024111516.59abc9ec@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <BY5PR12MB4322CC03CE0D34B83269676ADC190@BY5PR12MB4322.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR12MB4322CC03CE0D34B83269676ADC190@BY5PR12MB4322.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig-owner@lists.linaro.org"
 <linaro-mm-sig-owner@lists.linaro.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hch@lst.de" <hch@lst.de>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 syzbot <syzbot+34dc2fea3478e659af01@syzkaller.appspotmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
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

On Mon, Oct 26, 2020 at 05:23:48AM +0000, Parav Pandit wrote:
> Hi Christoph,
> 
> > From: Jakub Kicinski <kuba@kernel.org>
> > Sent: Saturday, October 24, 2020 11:45 PM
> > 
> > CC: rdma, looks like rdma from the stack trace
> > 
> > On Fri, 23 Oct 2020 20:07:17 -0700 syzbot wrote:
> > > syzbot has found a reproducer for the following issue on:
> > >
> > > HEAD commit:    3cb12d27 Merge tag 'net-5.10-rc1' of git://git.kernel.org/..
> 
> In [1] you mentioned that dma_mask should not be set for dma_virt_ops.
> So patch [2] removed it.
>
> But check to validate the dma mask for all dma_ops was added in [3].
> 
> What is the right way? Did I misunderstood your comment about dma_mask in [1]?

No, I did not say we don't need the mask.  I said copying over the
various dma-related fields from the parent is bogus.

I think rxe (and ther other drivers/infiniband/sw drivers) need a simple
dma_coerce_mask_and_coherent and nothing else.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
