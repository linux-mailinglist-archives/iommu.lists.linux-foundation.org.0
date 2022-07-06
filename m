Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBFF56923C
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 20:55:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9E5440122;
	Wed,  6 Jul 2022 18:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9E5440122
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=pUw4L9rT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xu30uEBh3bwy; Wed,  6 Jul 2022 18:55:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CD10540003;
	Wed,  6 Jul 2022 18:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD10540003
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89140C0077;
	Wed,  6 Jul 2022 18:55:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BE0EC002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 18:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04D2160783
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 18:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04D2160783
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com
 header.a=rsa-sha256 header.s=pps0720 header.b=pUw4L9rT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXFgwonk30Xw for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 18:55:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12AE606B0
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C12AE606B0
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 18:55:30 +0000 (UTC)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266IYSeV028868;
 Wed, 6 Jul 2022 18:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pps0720; bh=V/RKn4cwO8Jde9mbP6eJbdj72qAcC8xBRDOOWhNiMSQ=;
 b=pUw4L9rTo/LcMp9rbfH5fVTlVoZPIp2IpjUUFCXGswZVBnMVRknIQWCdfywOivE7pwU/
 amOiqGfhXKw53yx3Xc+dIp6/NP7oHWKsbNUeiaog+z2orlR0oBcl7EaKxtFNHe+/C1CM
 cL33+GW86PUOpuIX8JmVtR9AnblimvI0TEaXupudK67nNhwqG/7RocOXX123ITXehd3A
 vIXzfs+DP/asTrOpSRMXWY9l4Te9pqbEk1Ph1vQJyuat0Ynxm8mrpE7csbXme3VhP7Wg
 ZM2GjUQ2CrK5zvQrRP6JctuvGNjjLI8nO6GdmAN4CfmbUKxhhMwnVZT8xml8dbyXJYMR Ug== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3h5fst04wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jul 2022 18:55:15 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by p1lg14880.it.hpe.com (Postfix) with ESMTPS id B307B80022C;
 Wed,  6 Jul 2022 18:55:13 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id CF5F2809A09;
 Wed,  6 Jul 2022 18:55:11 +0000 (UTC)
Date: Wed, 6 Jul 2022 13:55:10 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v1 0/6] iommu/vt-d: Reset DMAR_UNITS_SUPPORTED
Message-ID: <YsXajixg7mN8PLtX@swahl-home.5wahls.com>
References: <20220625125204.2199437-1-baolu.lu@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20220625125204.2199437-1-baolu.lu@linux.intel.com>
X-Proofpoint-GUID: 7ym3B4n5N3oaqW6wr62eHBRkqpjXsZps
X-Proofpoint-ORIG-GUID: 7ym3B4n5N3oaqW6wr62eHBRkqpjXsZps
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_11,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 mlxlogscore=773 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060073
Cc: Dimitri Sivanich <sivanich@hpe.com>, Kevin Tian <kevin.tian@intel.com>,
 Russ Anderson <russ.anderson@hpe.com>, Steve Wahl <steve.wahl@hpe.com>,
 Mike Travis <mike.travis@hpe.com>, Jerry Snitselaar <jsnitsel@redhat.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>
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

On Sat, Jun 25, 2022 at 08:51:58PM +0800, Lu Baolu wrote:
> Hi folks,
> 
> This is a follow-up series of changes proposed by this patch:
> 
> https://lore.kernel.org/linux-iommu/20220615183650.32075-1-steve.wahl@hpe.com/
> 
> It removes several static arrays of size DMAR_UNITS_SUPPORTED and sets
> the DMAR_UNITS_SUPPORTED to 1024.
> 

After Kevin Tian's comments, for the whole series:

Reviewed-by: Steve Wahl <steve.wahl@hpe.com>

--> Steve

-- 
Steve Wahl, Hewlett Packard Enterprise
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
