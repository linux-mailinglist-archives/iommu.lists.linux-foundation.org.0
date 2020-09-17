Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CA726E11C
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 18:49:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1856087152;
	Thu, 17 Sep 2020 16:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUzREmQ9-QFH; Thu, 17 Sep 2020 16:49:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B4F4787156;
	Thu, 17 Sep 2020 16:49:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99034C0051;
	Thu, 17 Sep 2020 16:49:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12F2DC0051
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 16:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EE9E087154
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 16:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id miGe7j6G7Z3h for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 16:49:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7D3F487152
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 16:49:48 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08HGXhhA148832;
 Thu, 17 Sep 2020 16:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=jPn0/XY5IOGo+IYmlhGxIPpCwCN5Gs5hW39ZfBTuBys=;
 b=C+zGRgmOu7PauWqc7CzicotswSxxZ8ohmezMsNMMUogRMNhPpnE+baRIB/r5KxAPS8iY
 yVPGv8zXWaJALXvDhoQ3RlXpOCj/AG4YBhYoPOlWNWBR6Te/xwv6/FSGJ8lrmW78sRV1
 l+xpuVyzXH4zPkNP3brwg841EpBQ7wftxdvX3hlpRAw6VFZKpK3apeLRmlBgv7nOBH6/
 cElCL8H0o8ZZFbbrmj8/XmJyO/nFjq3zM9dCCSqqDDRIypm2Yl0IU1nCrZGyP53EpxIi
 iRFV8Cu06oA+oM6/A0yTfYpb9Ot7aQTYrv92vxVBHUDXhhuNXa/nHskTEhAa07DzVOgz 0g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 33gnrraj5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Sep 2020 16:49:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08HGZZRD061681;
 Thu, 17 Sep 2020 16:47:44 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 33h88bven0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 16:47:44 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08HGlgsv014673;
 Thu, 17 Sep 2020 16:47:43 GMT
Received: from [10.39.232.73] (/10.39.232.73)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Sep 2020 16:47:42 +0000
Subject: Re: [PATCH V2] dma-direct: Fix potential NULL pointer dereference
To: Christoph Hellwig <hch@lst.de>
References: <1600289466-23805-1-git-send-email-thomas.tai@oracle.com>
 <20200917164420.GA5959@lst.de>
From: Thomas Tai <thomas.tai@oracle.com>
Message-ID: <ec490dc9-f284-c1ed-9657-aa23276ee0cc@oracle.com>
Date: Thu, 17 Sep 2020 12:47:40 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917164420.GA5959@lst.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009170126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170126
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-kernel@vger.kernel.org, konrad.wilk@oracle.com
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



On 2020-09-17 12:44 p.m., Christoph Hellwig wrote:
> Thanks,
> 
> applied to the dma-mapping for-next tree.

Thank you, Christoph for suggesting and applying the fix.

Thomas

> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
