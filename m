Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2624791E
	for <lists.iommu@lfdr.de>; Mon, 17 Aug 2020 23:49:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 37F81855C6;
	Mon, 17 Aug 2020 21:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cP9HOlbTULCT; Mon, 17 Aug 2020 21:49:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99C5384DD5;
	Mon, 17 Aug 2020 21:49:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CED36C0895;
	Mon, 17 Aug 2020 21:49:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 316D1C0051
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 21:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 119D9203DE
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 21:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wT7n2CFUYlLo for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 21:49:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by silver.osuosl.org (Postfix) with ESMTPS id 7C68820115
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 21:49:04 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HLX0Hb022210; Mon, 17 Aug 2020 17:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=Tq/uE0SXbNExMxY3ew7lO372jMbMpFBJGrQbS5RiDDE=;
 b=gIUAROwkI6VGltsJX/wTziYt2Hh1LIpA1aLhttWDsGrHQMdipl26J0DpLGOm+tkBgI+t
 z4aRFlvzaxnAY93L8llPPiqVwNksZVjWAokGnXNY1QhV1mrS64fterjNXSquN3AsL5dt
 fO0S4V9ePFTTwqSkt86flY1q+kEhRb35QlQ7x64i3X2Ip8enFXEt2WebCPa1SUDBWbDC
 qnCBmp2BnQKr3hiZw9Z9aFpGRx8DdRDqbvWQAAPPWGSne8zVMsqy6Cs/UWz+381P0xVb
 1Cl+n5s0j3jYJQc9iIjycr39nzX7YpfV1EPVkm1PgIdsHWhZJxZ5Ui2VUlhw10LJkG+X oA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32yxagwvn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 17:48:58 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HLien2011858;
 Mon, 17 Aug 2020 21:48:56 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 32x7b911yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 21:48:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HLmtm819005936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 21:48:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7784778063;
 Mon, 17 Aug 2020 21:48:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C599E78060;
 Mon, 17 Aug 2020 21:48:52 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.138.167])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 17 Aug 2020 21:48:52 +0000 (GMT)
References: <20200815204536.663801-1-bauerman@linux.ibm.com>
 <20200817102020.GD25336@lst.de>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] swiotlb: Allow allocating buffer anywhere in memory
In-reply-to: <20200817102020.GD25336@lst.de>
Date: Mon, 17 Aug 2020 18:48:49 -0300
Message-ID: <87o8n96j0e.fsf@morokweng.localdomain>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_15:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=930 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170146
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 linuxppc-dev@lists.ozlabs.org, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>
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


Hello Christoph,

Christoph Hellwig <hch@lst.de> writes:

> On Sat, Aug 15, 2020 at 05:45:36PM -0300, Thiago Jung Bauermann wrote:
>> POWER secure guests (i.e., guests which use the Protection Execution
>> Facility) need to use SWIOTLB to be able to do I/O with the hypervisor, but
>> they don't need the SWIOTLB memory to be in low addresses since the
>> hypervisor doesn't have any addressing limitation.
>> 
>> This solves a SWIOTLB initialization problem we are seeing in secure guests
>> with 128 GB of RAM: they are configured with 4 GB of crashkernel reserved
>> memory, which leaves no space for SWIOTLB in low addresses.
>
> What about just open coding the allocation and using
> swiotlb_init_with_tbl?

Yes, that works too. I just sent a v2 implementing that change. I just
had to add a small accessor function so that I could set no_iotlb_memory
from outside swiotlb.c.

Thank you for the quick review.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
