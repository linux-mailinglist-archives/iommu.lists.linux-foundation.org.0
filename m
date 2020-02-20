Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1201661D8
	for <lists.iommu@lfdr.de>; Thu, 20 Feb 2020 17:08:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA5E6875A2;
	Thu, 20 Feb 2020 16:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zojzJ0LtzzHG; Thu, 20 Feb 2020 16:08:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB316871F4;
	Thu, 20 Feb 2020 16:08:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1927C1D8E;
	Thu, 20 Feb 2020 16:08:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 128DBC013E
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 16:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0E9CB87D0B
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 16:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DPrshgJjCHR for <iommu@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 16:08:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4624487D09
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 16:08:01 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KG01eN100950
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 11:08:00 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y9tkbxxqk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 11:08:00 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <iommu@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Thu, 20 Feb 2020 16:07:58 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 16:07:53 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KG6bC651511464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 16:06:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E262AE055;
 Thu, 20 Feb 2020 16:06:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF0B3AE058;
 Thu, 20 Feb 2020 16:06:36 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 16:06:36 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM 
Date: Thu, 20 Feb 2020 17:06:04 +0100
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 20022016-0016-0000-0000-000002E8A994
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022016-0017-0000-0000-0000334BC6D6
Message-Id: <20200220160606.53156-1-pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_04:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=952 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200118
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Currently if one intends to run a memory protection enabled VM with
virtio devices and linux as the guest OS, one needs to specify the
VIRTIO_F_IOMMU_PLATFORM flag for each virtio device to make the guest
linux use the DMA API, which in turn handles the memory
encryption/protection stuff if the guest decides to turn itself into
a protected one. This however makes no sense due to multiple reasons:
* The device is not changed by the fact that the guest RAM is
protected. The so called IOMMU bypass quirk is not affected.
* This usage is not congruent with  standardised semantics of
VIRTIO_F_IOMMU_PLATFORM. Guest memory protected is an orthogonal reason
for using DMA API in virtio (orthogonal with respect to what is
expressed by VIRTIO_F_IOMMU_PLATFORM). 

This series aims to decouple 'have to use DMA API because my (guest) RAM
is protected' and 'have to use DMA API because the device told me
VIRTIO_F_IOMMU_PLATFORM'.

Please find more detailed explanations about the conceptual aspects in
the individual patches. There is however also a very practical problem
that is addressed by this series. 

For vhost-net the feature VIRTIO_F_IOMMU_PLATFORM has the following side
effect The vhost code assumes it the addresses on the virtio descriptor
ring are not guest physical addresses but iova's, and insists on doing a
translation of these regardless of what transport is used (e.g. whether
we emulate a PCI or a CCW device). (For details see commit 6b1e6cc7855b
"vhost: new device IOTLB API".) On s390 this results in severe
performance degradation (c.a. factor 10). BTW with ccw I/O there is
(architecturally) no IOMMU, so the whole address translation makes no
sense in the context of virtio-ccw.

Halil Pasic (2):
  mm: move force_dma_unencrypted() to mem_encrypt.h
  virtio: let virtio use DMA API when guest RAM is protected

 drivers/virtio/virtio_ring.c |  3 +++
 include/linux/dma-direct.h   |  9 ---------
 include/linux/mem_encrypt.h  | 10 ++++++++++
 3 files changed, 13 insertions(+), 9 deletions(-)


base-commit: ca7e1fd1026c5af6a533b4b5447e1d2f153e28f2
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
