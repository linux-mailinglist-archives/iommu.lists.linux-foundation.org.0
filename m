Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B26D3D5B9
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 20:47:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9B04910BE;
	Tue, 11 Jun 2019 18:47:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3C105F82
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 18:47:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7F3A284C
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 18:47:34 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5BIhxEf102338; Tue, 11 Jun 2019 18:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=iGKDVV/BwgaHNmFqdmDqIdqAkhZ2JTEOnwjGqvNBXfQ=;
	b=ZdeA2rc/ZN9bG+KTOqrNWC6lC5QUnAwAIv0X3Qi2fBBLUveDcyLyUM1OnHdHTF9pC3Zr
	BoWa1eTWUU+iqnB/878HYNBl9Mx6Aqjm/MGO5PGaiZ/XXh2Jwn6/VLn/4mrRVVsh1Rcc
	uSRREXLHfQUZI8ua80XOHHDLaUGXxmVT8/NoQ2ahw7SbIXvjE1EjFUNLP6RoGmBd0jO0
	uOeKbJdKgoo0dLIFt8kyRknguoGdrqYf2t5nLw8X4xqTVt8m7erdkRp9JsO+lHm9Eavz
	FrEnc2saVwgiWW2ehJtYst4KzM2YpLRUr1atY+gKE/gKJSj3cht3Vh4/FuMcpS2gt138
	6w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 2t04etq3hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jun 2019 18:47:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5BIknow091194; Tue, 11 Jun 2019 18:47:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 2t1jphkvbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jun 2019 18:47:22 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5BIlBa5018032;
	Tue, 11 Jun 2019 18:47:12 GMT
Received: from char.us.oracle.com (/10.152.32.25)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 11 Jun 2019 11:47:11 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
	id 00C246A0116; Tue, 11 Jun 2019 14:48:34 -0400 (EDT)
Date: Tue, 11 Jun 2019 14:48:34 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 0/2] swiotlb: Cleanup and consistency fix
Message-ID: <20190611184834.GD12859@char.us.oracle.com>
References: <20190611175825.572-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611175825.572-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1906110119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906110120
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	"open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
	linux-kernel@vger.kernel.org, Vivien Didelot <vivien.didelot@gmail.com>,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
	bcm-kernel-feedback-list@broadcom.com, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
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

On Tue, Jun 11, 2019 at 10:58:23AM -0700, Florian Fainelli wrote:
> Hi Christoph,

I pulled the patches in my tree. 
> 
> Still with my contrived memory layout where there is no physical memory
> the kernel can use below 4GB, it was possible to fail swiotlb_init(),
> but still not hit swiotlb_map_single() since all peripherals have a
> DMA_BIT_MASK() that is within the remaining addressable physical memory.
> 
> The second path could be backported to stable, but for the same reasons
> as the one we had just discussed before, this requires a very contrived
> test case that is not necessarily realistic or would warrant a stable
> backport IMHO.
> 
> Thanks!
> 
> Florian Fainelli (2):
>   swiotlb: Group identical cleanup in swiotlb_cleanup()
>   swiotlb: Return consistent SWIOTLB segments/nr_tbl
> 
>  kernel/dma/swiotlb.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> -- 
> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
