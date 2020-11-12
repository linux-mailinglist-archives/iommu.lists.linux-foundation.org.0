Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BBD2B0B6D
	for <lists.iommu@lfdr.de>; Thu, 12 Nov 2020 18:39:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 321702E1CF;
	Thu, 12 Nov 2020 17:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jm1PHDu-Gh31; Thu, 12 Nov 2020 17:39:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B5D8C2E1B2;
	Thu, 12 Nov 2020 17:39:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99F98C016F;
	Thu, 12 Nov 2020 17:39:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC83EC016F
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 17:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C32F12E1B2
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 17:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiBffgTlBPFQ for <iommu@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 17:39:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by silver.osuosl.org (Postfix) with ESMTPS id E707B20463
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 17:39:08 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id z13so1209267qvs.4
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 09:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9/BWB2JMcyfr9SsyIuCQhSr0cozjVOSg0qZsEvg/Gec=;
 b=ScUqn50Av3jkuanAHL9FGgKs2H2CEtXkHfhtLCKnJl/JiHzXM6ZbzMHOwZ2hp+OVWx
 Fi+0vs1eN6mEx8OmQp7fn4u8wWGm8kj8NVs7rBtEM7yvcDuwy5qDdx1T0eYjrmriTWdQ
 TA3moLECIUN1PPVAu7IX9pZj8s7lUFYHIf/pVvChzvfn/0oXRiGe/H0vUzt7bo0jX06e
 tmnOhDEESzGoBN/C/rIcyYQA3vEILCTSVyippGbU4XhjiCwQUYijQdef9FmKKpYJTadq
 RJuyOMJeRyyohYZIhVoK3M2B9uoBrkvVFWuxnJaphy18XoYCDwDAKW9xlbTD7A35Jvfi
 k+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9/BWB2JMcyfr9SsyIuCQhSr0cozjVOSg0qZsEvg/Gec=;
 b=IY21vQimVAuNmpoWZctdL9AnNbIpMsF3/DWsFUsw9Wu2etfIHA+AWxBRNoQNE/3ooe
 oyxhPDnr00DT80gYHZ7vETUK/tdhnF0piFlYNrYM29TP8+IZRL5FQpq43Ou980HqIMql
 jStp8LGYOQzzoPESrgAHjHXoMaIvR/DSPRmyQNc3/fM8wNWptkUvIGpqX4u92cqE5oZc
 KH53iHqe9K3LjA1TF/0+4foJD75GbGC29pMYYDdkeOKB1jcV6Px8Q93skkdZ9s7FborU
 N0NyTf9jpCH3DGTR6mTx9ydzMhCH8N98M65yRf5sLzseCs7wEIDgNUndU9TvYjaHCPjT
 Wx+g==
X-Gm-Message-State: AOAM533Uc5SFIJZH2ARPUVad9xIbIr4THjSfvhLS+92AovxXNT4SRR4F
 9oijg5RKdXtWzZT1jQ8yhKEjew==
X-Google-Smtp-Source: ABdhPJxGjs7RKm1+d6vm7YlPcQDBoWbQJjGD0bECyIRJfi4QeWUNLlgH4DteMkEt2qfo5HNkxSMv+g==
X-Received: by 2002:a0c:f607:: with SMTP id r7mr714119qvm.47.1605202747806;
 Thu, 12 Nov 2020 09:39:07 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id d12sm4989837qtp.77.2020.11.12.09.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 09:39:07 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kdGYs-003z7n-Ku; Thu, 12 Nov 2020 13:39:06 -0400
Date: Thu, 12 Nov 2020 13:39:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove dma_virt_ops v2
Message-ID: <20201112173906.GT244516@ziepe.ca>
References: <20201106181941.1878556-1-hch@lst.de>
 <20201112165935.GA932629@nvidia.com>
 <20201112170956.GA18813@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112170956.GA18813@lst.de>
Cc: rds-devel@oss.oracle.com, Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>
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

On Thu, Nov 12, 2020 at 06:09:56PM +0100, Christoph Hellwig wrote:
> On Thu, Nov 12, 2020 at 12:59:35PM -0400, Jason Gunthorpe wrote:
> >  RMDA/sw: Don't allow drivers using dma_virt_ops on highmem configs
> 
> I think this one actually is something needed in 5.10 and -stable.

Done, I added a

Fixes: 551199aca1c3 ("lib/dma-virt: Add dma_virt_ops")

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
