Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E401266826
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 20:17:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1FFF87B55;
	Fri, 11 Sep 2020 18:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6wqCsp64gPT; Fri, 11 Sep 2020 18:17:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 387EE87B53;
	Fri, 11 Sep 2020 18:17:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BD72C0051;
	Fri, 11 Sep 2020 18:17:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 003D0C0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 18:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DC26387B39
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 18:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKTCU3DIp3C9 for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 18:01:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 494D887B3E
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 18:01:28 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08BHxNun136182;
 Fri, 11 Sep 2020 18:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=K/lrGLKQLzPCde1LBeenvfV12lSqYozwSEeErGwFLx0=;
 b=p3td48CvzFQw8bp+qotx7y2XNGDz349JG2L68Ognkw/J+TLmf6hry58o/0azGGJDmM3n
 T2x07sp/D5YQGaD0JXWu/RuYc0P2QPMQfmCfhhZgy4tNbp7XB0MLpDIgzjNviZisFdwJ
 tVRbf1BuYXl9BQ68SiM4IlLykbmhWv8/LD46cuyF6W3vMasF3dL496+iLWpZHe8/PWM7
 1CZZGbudcuqz2D48aVZZQx0LmiwLjLBM9yeRroGmg9ku5x9sA7JKbKkITdsE+m2iaNNh
 dM+YXKKldp/6uh38YsMh0M8sBrZhq8oX68S7iURwWht61uYrEshzXXCL4PiUKt28MJ4p Xw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 33c23rfrhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Sep 2020 18:01:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08BHximb049957;
 Fri, 11 Sep 2020 18:00:59 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 33dacqayvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Sep 2020 18:00:59 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08BI0t3G026796;
 Fri, 11 Sep 2020 18:00:55 GMT
Received: from [10.74.108.237] (/10.74.108.237)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Sep 2020 11:00:55 -0700
Subject: Re: [PATCH 2/3] ARM/keystone: move the DMA offset handling under
 ifdef CONFIG_ARM_LPAE
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Christoph Hellwig <hch@lst.de>
References: <20200910054038.324517-1-hch@lst.de>
 <20200910054038.324517-3-hch@lst.de>
 <20200911111551.GG1551@shell.armlinux.org.uk>
From: santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <f13c72b9-9efa-7b9d-6c23-19f87b151bc4@oracle.com>
Date: Fri, 11 Sep 2020 11:00:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200911111551.GG1551@shell.armlinux.org.uk>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9741
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9741
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110145
X-Mailman-Approved-At: Fri, 11 Sep 2020 18:16:58 +0000
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-sh@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-usb@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 9/11/20 4:15 AM, Russell King - ARM Linux admin wrote:
> On Thu, Sep 10, 2020 at 07:40:37AM +0200, Christoph Hellwig wrote:
>> The DMA offset notifier can only be used if PHYS_OFFSET is at least
>> KEYSTONE_HIGH_PHYS_START, which can't be represented by a 32-bit
>> phys_addr_t.  Currently the code compiles fine despite that, a pending
>> change to the DMA offset handling would create a compiler warning for
>> this case.  Add an ifdef to not compile the code except for LPAE
>> configs.
> 
> However, to have use of the high physical offset, LPAE needs to be
> enabled, which ensures that phys_addr_t is 64-bit.
> 
> I believe that DMA is non-coherent on this platform unless the high
> physical address is used. Or something like that.
> 
Exactly. Higher address ranges needs to be used for DMA coherency.

Regards,
Santosh
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
