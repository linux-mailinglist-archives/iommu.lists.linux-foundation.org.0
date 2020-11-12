Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D32B065D
	for <lists.iommu@lfdr.de>; Thu, 12 Nov 2020 14:24:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E96918774E;
	Thu, 12 Nov 2020 13:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0056AYodd+L6; Thu, 12 Nov 2020 13:23:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9F37876FC;
	Thu, 12 Nov 2020 13:23:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9932AC016F;
	Thu, 12 Nov 2020 13:23:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74B97C016F
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 13:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 596B7870AD
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 13:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id toIqx+bbKTXM for <iommu@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:23:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 899C687094
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 13:23:55 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id n132so5171344qke.1
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 05:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GgG+Zz++harjLdBXmMOeRXPhrbguvX47VfJimEaHELU=;
 b=JwWcwOy5hNV6Hs44MXlDrQMT9b8rvnkfLKT5x15JkGlQAL2D/g3vkEXmtuyY73EX6o
 0KEuYAaOT/zHSDTaNE7HmvJCG+FzAyx5YAhHwnfq5EOc4rgw+CffXgMVIFUESJNkl5os
 9HmCYfhwC758cBhubKJFWsIAWeEJMVzEWhyjhj/Ht0TTcziWf3PPh5fFBeEdnrX+hs+1
 XhbIXpcii4+DpBpk0gr5zFemIIzbRZ7tn5BuV/igI8xW0OJgEpL4cKXVyfBXb5JWlRaD
 5jHm2vhwGsyCuWRLmRZmCBXacFxtj+qlmsQ+TsjCcSKL8ngO+dHatJ0AU9/jCmaP5A6C
 9cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GgG+Zz++harjLdBXmMOeRXPhrbguvX47VfJimEaHELU=;
 b=muX0myIC0EbcxOCTWZKGucFSLgeba1j2lN8m7aXLiBGFFQ/rfLvKHkIgEtNGzbIIql
 QITqSkRQLm/Iyjopp+I0lfas8lGdWfDDsXgZHrBNFcMYlk7bjSIf3XxAGq2ECY4rXwJ8
 pxEP7C3sankeNNWwXQMgASylx8JXmUADeS7nY+W51scHmoqhXKTieJYGta01TrGh+/1E
 n2wE87LmRWAjeNy77ktrqOTx8UTnOh8197rEX+PYNiqRJLmmKk/pGsiykO9eurcip0MR
 gjBZbyLAwJ/pda4jkrsf+YW2MB+S0xB5pEhazj3fdR777Ekhr4BCTuoabxsTnmOwh1gJ
 JJbQ==
X-Gm-Message-State: AOAM531w/66BsHwONfZmIFXQKQQKQgbMUMnozke4vUMKXYgQ3wLTvqDc
 V2V0dsZeA3WQL8DlAWlkuURdBA==
X-Google-Smtp-Source: ABdhPJywkel8XB3mJwdENyyP8p0fxAGX2JW0meUrbieCppFxtts7eDEAYv3M6qnci9wS8irt7c69Bw==
X-Received: by 2002:a37:2c85:: with SMTP id
 s127mr30634838qkh.381.1605187434481; 
 Thu, 12 Nov 2020 05:23:54 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id j16sm4820609qkg.26.2020.11.12.05.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 05:23:53 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kdCZt-003foe-6x; Thu, 12 Nov 2020 09:23:53 -0400
Date: Thu, 12 Nov 2020 09:23:53 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: remove dma_virt_ops v2
Message-ID: <20201112132353.GQ244516@ziepe.ca>
References: <20201106181941.1878556-1-hch@lst.de>
 <20201112094030.GA19550@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112094030.GA19550@lst.de>
Cc: rds-devel@oss.oracle.com, Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>
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

On Thu, Nov 12, 2020 at 10:40:30AM +0100, Christoph Hellwig wrote:
> ping?
> 
> On Fri, Nov 06, 2020 at 07:19:31PM +0100, Christoph Hellwig wrote:
> > Hi Jason,
> > 
> > this series switches the RDMA core to opencode the special case of
> > devices bypassing the DMA mapping in the RDMA ULPs.  The virt ops
> > have caused a bit of trouble due to the P2P code node working with
> > them due to the fact that we'd do two dma mapping iterations for a
> > single I/O, but also are a bit of layering violation and lead to
> > more code than necessary.
> > 
> > Tested with nvme-rdma over rxe.
> > 
> > Note that the rds changes are untested, as I could not find any
> > simple rds test setup.
> > 
> > Changes since v2:
> >  - simplify the INFINIBAND_VIRT_DMA dependencies
> >  - add a ib_uses_virt_dma helper
> >  - use ib_uses_virt_dma in nvmet-rdma to disable p2p for virt_dma devices
> >  - use ib_dma_max_seg_size in umem
> >  - stop using dmapool in rds
> > 
> > Changes since v1:
> >  - disable software RDMA drivers for highmem configs
> >  - update the PCI commit logs

Santosh can you please check the RDA parts??

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
