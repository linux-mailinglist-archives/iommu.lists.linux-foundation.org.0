Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C64676F0
	for <lists.iommu@lfdr.de>; Sat, 13 Jul 2019 01:50:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6B9645C22;
	Fri, 12 Jul 2019 23:50:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0BC1A5B46
	for <iommu@lists.linux-foundation.org>;
	Fri, 12 Jul 2019 23:43:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 879DA887
	for <iommu@lists.linux-foundation.org>;
	Fri, 12 Jul 2019 23:43:07 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x6CNfvm1034924; Fri, 12 Jul 2019 19:42:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2tq31ahvng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Jul 2019 19:42:49 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6CNgnmu036004;
	Fri, 12 Jul 2019 19:42:49 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
	[169.63.214.131])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2tq31ahvn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Jul 2019 19:42:49 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	x6CNdMRr019151; Fri, 12 Jul 2019 23:42:48 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
	[9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 2tjk97y53g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Jul 2019 23:42:48 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x6CNglgS51118432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 12 Jul 2019 23:42:47 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85C7AAC05B;
	Fri, 12 Jul 2019 23:42:47 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6DD3AC059;
	Fri, 12 Jul 2019 23:42:40 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.135.203])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Fri, 12 Jul 2019 23:42:40 +0000 (GMT)
References: <20190712053631.9814-1-bauerman@linux.ibm.com>
	<20190712053631.9814-3-bauerman@linux.ibm.com>
	<20190712071328.GA22889@lst.de>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/3] DMA mapping: Move SME handling to x86-specific files
In-reply-to: <20190712071328.GA22889@lst.de>
Date: Fri, 12 Jul 2019 20:42:31 -0300
Message-ID: <87r26ug6qg.fsf@morokweng.localdomain>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-07-12_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1907120244
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Mike Anderson <andmike@linux.ibm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	Halil Pasic <pasic@linux.ibm.com>,
	iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "Lendacky,
	Thomas" <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
	Alexey Dobriyan <adobriyan@gmail.com>
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


[ Cc'ing Tom Lendacky which I forgot to do earlier. Sorry about that. ]

Hello Christoph,

Christoph Hellwig <hch@lst.de> writes:

> Honestly I think this code should go away without any replacement.
> There is no reason why we should have a special debug printk just
> for one specific reason why there is a requirement for a large DMA
> mask.

Makes sense. I'll submit a v2 which just removes this code.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
