Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6422A6B42
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 18:00:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9067F85FEF;
	Wed,  4 Nov 2020 17:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ae7-Fp7JlU3q; Wed,  4 Nov 2020 17:00:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9510085FC7;
	Wed,  4 Nov 2020 17:00:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 796BFC0051;
	Wed,  4 Nov 2020 17:00:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE186C0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 17:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AA3B4203A4
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 17:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gxX7nXE6wO1 for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 17:00:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by silver.osuosl.org (Postfix) with ESMTPS id 08F402033D
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N2SOPoHvV67QYSDBorQI+Eny1/8pxEWrPXW/WFBv0+c=; b=jByByxLeD2jWOeF1OeD5LergUb
 x9NqBqY5HMYmItZ7/h0PBJ13GF7wUQesel8515f/oOJYYevRUTj3bJ6ZlQJRROJrQ1Rre53BF6Zw0
 SZajwdv93St9xVJOjqjS8QA4bejzTTfzPm5hDLnLCDpRrhJcOMm9KbBHX0P3Y1f5bH4p6z3l3gHWn
 vZGmN3yHOMegh1PM0boFWFPGH/mvD3jxaUIVYAbeUovIAwr0z0EIStrvKmtoevRtM0B/TLNT7Es5L
 CGznzxe0zDJdNeQusIaUhmUxKps947uNp5WAygFQC2nD/RRJ+4mGe0NqYBroMfDLxs9zmgd4epV8R
 6i+qHfAQ==;
Received: from s01060023bee90a7d.cg.shawcable.net ([24.64.145.4]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1kaM9P-0001Ul-Li; Wed, 04 Nov 2020 10:00:48 -0700
To: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20201104095052.1222754-1-hch@lst.de>
 <20201104095052.1222754-4-hch@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <6396d3e3-c9a6-e86f-ab1c-df3561b6517a@deltatee.com>
Date: Wed, 4 Nov 2020 10:00:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104095052.1222754-4-hch@lst.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 24.64.145.4
X-SA-Exim-Rcpt-To: iommu@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 linux-rdma@vger.kernel.org, bhelgaas@google.com, jgg@ziepe.ca, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 3/5] PCI/p2p: remove the DMA_VIRT_OPS hacks
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-rdma@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-pci@vger.kernel.org
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




On 2020-11-04 2:50 a.m., Christoph Hellwig wrote:
> Now that all users of dma_virt_ops are gone we can remove the workaround
> for it in the PCIe peer to peer code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The two P2PDMA patches look fine to me. Nice to get rid of that hack.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Thanks,

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
