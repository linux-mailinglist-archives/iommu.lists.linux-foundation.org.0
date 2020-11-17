Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 696172B6EDF
	for <lists.iommu@lfdr.de>; Tue, 17 Nov 2020 20:41:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 071C286382;
	Tue, 17 Nov 2020 19:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NtbmVjOEPDQ; Tue, 17 Nov 2020 19:41:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1277B8639E;
	Tue, 17 Nov 2020 19:41:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0026FC07FF;
	Tue, 17 Nov 2020 19:41:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E65B8C07FF
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 19:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D4D9E85B4A
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 19:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xR-wrwN3tNwM for <iommu@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 19:41:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ABA698560F
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 19:41:33 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb427640000>; Tue, 17 Nov 2020 11:41:24 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 19:41:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 17 Nov 2020 19:41:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8S/mZQbZ+wSJMwed2tnC83wffG4dhfa638mkJURcO74siBaCip6+xrI+TIielfXy5J2/mbod8JpoLhv+azB7BwyKE7RoiDpnBuVDjGShv9NhRuUzBsVeIGh1v3ZEKnarto9zbx1jQ2YJJM5cbhOzNyWhiwaSbXFyHyGMhlyi4wtxnPGoe+y/i0YV3m8tHGfFEL85gBIN12Eios6I6hX4+JDp5dSGueOsehL3ZAut5jYsW/nqd0nFFLMhwas+zhiE+WamQ/kyBS71myPRyftfZjKrXs2sbJCXVZVI2uH28YbuGIMT7kaW7CLZVLxGZSO6ZV8NAuj9thyg/vYgrovpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJM5Y9H78KXYKRCnnVEEJagbt01lS64k9Cqs2QVudZA=;
 b=etF8OHVJvidJtM3r/DGme97xNALnpTmWeikLd37mvgrfGiYsj7JrxzSZGgsJ5nK+r5AY9n8SksWMjR8zRQBYvS7j7XNmfMmc63AK6Am77AAKeeYUfV0p6q+3JsZv0GGCsvYJJsr/RGkB2VXMZ3aUIUSGhBoTt9v1Ie1coLEw1AaeQG/h+nWZ8JDCvFccmZcwTuPe/6+5TbYF44ET96uKIRtssotP4cdzxTM3VXREAzwnLgsqCssDMZEa5RmXFAEmjRRGZhpEHnVjds3W2fNJFYWEgEhu8HeL5FomBcdxLgsfL68jpSFDnb2JIZxNSKrhmCsqzkgGWEgAvyL1rH6YZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3305.namprd12.prod.outlook.com (2603:10b6:5:189::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 19:41:32 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::e40c:730c:156c:2ef9]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::e40c:730c:156c:2ef9%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 19:41:31 +0000
Date: Tue, 17 Nov 2020 15:41:29 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove dma_virt_ops v2
Message-ID: <20201117194129.GA1757698@nvidia.com>
References: <20201106181941.1878556-1-hch@lst.de>
Content-Disposition: inline
In-Reply-To: <20201106181941.1878556-1-hch@lst.de>
X-ClientProxiedBy: MN2PR19CA0067.namprd19.prod.outlook.com
 (2603:10b6:208:19b::44) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 MN2PR19CA0067.namprd19.prod.outlook.com (2603:10b6:208:19b::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 17 Nov 2020 19:41:31 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kf6r3-007NGx-I0; Tue, 17 Nov 2020 15:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605642084; bh=jJM5Y9H78KXYKRCnnVEEJagbt01lS64k9Cqs2QVudZA=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=GE2QgNvnRwvZKRhh8TudXZKfjJl7PAfGgQx6aB9j7Yp+dW7iLeQI8L82ARv56ftOw
 w8a4q4CoNRLZqpWtNQZj8QUKbcWByvf8r4E5Jz4KXAPfrzFDnhUT9K6XiufMS7nHc/
 zsIW9ht2GbCcbw+NLPl0lFAgfUCVChDXhUCEPiFGvkY+SSfRlf7EmMzjIFU6ND9ENL
 iOC9obDWE2b2srpib4KwJaMI/MXXR+eMoUf+SazDOPICEo6E6HjDq91lu3Etn162Hv
 j+ZZ68UK1QO3rhV8FquSwZMOnhgYAAd4GDOSfPssuxA+EmOGUpnGu94le8xZJCgyPK
 DZuw3DTw+WGKA==
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

On Fri, Nov 06, 2020 at 07:19:31PM +0100, Christoph Hellwig wrote:
> Hi Jason,
> 
> this series switches the RDMA core to opencode the special case of
> devices bypassing the DMA mapping in the RDMA ULPs.  The virt ops
> have caused a bit of trouble due to the P2P code node working with
> them due to the fact that we'd do two dma mapping iterations for a
> single I/O, but also are a bit of layering violation and lead to
> more code than necessary.
> 
> Tested with nvme-rdma over rxe.
> 
> Note that the rds changes are untested, as I could not find any
> simple rds test setup.
> 
> Changes since v2:
>  - simplify the INFINIBAND_VIRT_DMA dependencies
>  - add a ib_uses_virt_dma helper
>  - use ib_uses_virt_dma in nvmet-rdma to disable p2p for virt_dma devices
>  - use ib_dma_max_seg_size in umem
>  - stop using dmapool in rds
> 
> Changes since v1:
>  - disable software RDMA drivers for highmem configs
>  - update the PCI commit logs

All applied to for-next, thanks everyone

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
