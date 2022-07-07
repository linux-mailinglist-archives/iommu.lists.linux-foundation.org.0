Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B41E56CD8B
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:38:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BB160E29;
	Sun, 10 Jul 2022 06:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BB160E29
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=xnJ9jBf8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ab7l9JydZrZi; Sun, 10 Jul 2022 06:37:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4885360BAA;
	Sun, 10 Jul 2022 06:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4885360BAA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44B93C002D;
	Sun, 10 Jul 2022 06:37:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D502FC002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 21:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6D6F408B2
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 21:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D6F408B2
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=xnJ9jBf8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5w1sv7OmvnL for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 21:47:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99961408A8
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99961408A8
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 21:47:42 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267KCRZY003652;
 Thu, 7 Jul 2022 21:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=mYUReDqAAtD2Mc/Slejp/JsQFVi9e1ncghZX3Vavmh0=;
 b=xnJ9jBf8Ufq6J0JVjaiWi0JryS/PVZ3dV0d11TbTkdML8UPIRmyHYhNMlt6sUKGAbpGU
 k64Gx9anLLCmwum/I538ASOgU7UbRmo0/u29MVFnQku7yXhDpqdJGknQJgZIIC+7PFfP
 6qYda/BRPr3r6+vj493eF+dScvU9YM4s8t2JLgWLYQl/zXR8xZlQ8D3ZS3wKx1kMJb2F
 Wuvi0Du4suhANFR9tbfeGAiD3ULI9Pz2yiGidy2GDPuTmHeR5W5sEf3iPLZfq0hS05mS
 g2ODR6pqBet/WF8GYQOzJ13vdtCxaIsKTlR+/B8gSHDywC5rA0KruYY4lScx0RauYNvz yQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubye73u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 21:47:28 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 267LjM4l030275; Thu, 7 Jul 2022 21:47:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud7c5bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 21:47:27 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 267LlRsY033607;
 Thu, 7 Jul 2022 21:47:27 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud7c5ag-1; Thu, 07 Jul 2022 21:47:27 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
Date: Thu,  7 Jul 2022 17:47:20 -0400
Message-Id: <165723020283.18731.6642678816129479253.b4-ty@oracle.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624155226.2889613-1-arnd@kernel.org>
References: <20220624155226.2889613-1-arnd@kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: HrfrZsc4HaH6Tm6et7M--Pti1gCHS_F-
X-Proofpoint-ORIG-GUID: HrfrZsc4HaH6Tm6et7M--Pti1gCHS_F-
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:51 +0000
Cc: linux-arch@vger.kernel.org, Miquel van Smoorenburg <mikevs@xs4all.net>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-parisc@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, linux-m68k@lists.linux-m68k.org,
 Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Matt Wang <wwentao@vmware.com>, linux-alpha@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Khalid Aziz <khalid@gonehiking.org>
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

On Fri, 24 Jun 2022 17:52:23 +0200, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The virt_to_bus/bus_to_virt interface has been deprecated for
> decades. After Jakub Kicinski put a lot of work into cleaning out the
> network drivers using them, there are only a couple of other drivers
> left, which can all be removed or otherwise cleaned up, to remove the
> old interface for good.
> 
> [...]

Applied to 5.20/scsi-queue, thanks!

[1/3] scsi: BusLogic remove bus_to_virt
      https://git.kernel.org/mkp/scsi/c/9f7c2232e131
[2/3] scsi: dpt_i2o: remove obsolete driver
      https://git.kernel.org/mkp/scsi/c/b04e75a4a8a8

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
