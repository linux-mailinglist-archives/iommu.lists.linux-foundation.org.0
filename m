Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E07C1423E96
	for <lists.iommu@lfdr.de>; Wed,  6 Oct 2021 15:22:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CC3360E58;
	Wed,  6 Oct 2021 13:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmTq_smKTaom; Wed,  6 Oct 2021 13:22:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 73BB160D55;
	Wed,  6 Oct 2021 13:22:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46FEAC000D;
	Wed,  6 Oct 2021 13:22:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B59E0C000D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Oct 2021 13:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A465483F34
 for <iommu@lists.linux-foundation.org>; Wed,  6 Oct 2021 13:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzLfJpUkvAeR for <iommu@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 13:22:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E20F983F28
 for <iommu@lists.linux-foundation.org>; Wed,  6 Oct 2021 13:22:15 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196D1WeM018298; 
 Wed, 6 Oct 2021 09:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=13K13eloHf8ndYtTcY5N4LUEpYMwEaYFKKgqxw1mQsQ=;
 b=M0jP2wJ2GS/YMXPZddX8eyMVYg8J5bJYUqNzyfTwrOBpnCWiVb9S5tiQlV7s1WoI3gFB
 yE+uMp75OAm89A8BYdfE9sXKzdftyxua16rjPPx27g3KrVwg/fvgJf3lYSdeUYiH0QcS
 baaqu+Feo0LdibdJiotzU3TmTibEKwUY58RWI3c25WgeZKx06OI/glaS550wXeFzHiG6
 orYE+bJrX9mXN6X/vgCcpqFK06XTFyvu5VUj3L55MKJTwb8VRktxu/7R3K2h2BnRgWcv
 W54uzmRh5vExP27HHpvWEFLUWNvl3WsZ4IeBfabiYDkSRBb+2dxTtoXwnWOMlR44oy8C Vw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bhcatrm3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 09:21:49 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 196DIj73009373;
 Wed, 6 Oct 2021 13:21:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3bef2b5s0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 13:21:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 196DLgpQ62980448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Oct 2021 13:21:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 434454C052;
 Wed,  6 Oct 2021 13:21:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F8D84C04A;
 Wed,  6 Oct 2021 13:21:40 +0000 (GMT)
Received: from thinkpad (unknown [9.171.8.189])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  6 Oct 2021 13:21:40 +0000 (GMT)
Date: Wed, 6 Oct 2021 15:21:38 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Hamza Mahfooz <someguy@effective-light.com>, Christoph Hellwig
 <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: DPAA2 triggers, [PATCH] dma debug: report -EEXIST errors in
 add_dma_entry
Message-ID: <20211006152138.160d64e5@thinkpad>
In-Reply-To: <20211006151043.61fe9613@thinkpad>
References: <20210518125443.34148-1-someguy@effective-light.com>
 <fd67fbac-64bf-f0ea-01e1-5938ccfab9d0@arm.com>
 <20210914154504.z6vqxuh3byqwgfzx@skbuf>
 <185e7ee4-3749-4ccb-6d2e-da6bc8f30c04@linux.ibm.com>
 <20211001145256.0323957a@thinkpad>
 <20211006151043.61fe9613@thinkpad>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jIdONCLNC4SJSBp-4glmMy_Rxf_99vb7
X-Proofpoint-GUID: jIdONCLNC4SJSBp-4glmMy_Rxf_99vb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_02,2021-10-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110060082
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Robin Murphy <robin.murphy@arm.com>,
 Karsten Graul <kgraul@linux.ibm.com>
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

On Wed, 6 Oct 2021 15:10:43 +0200
Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:

> On Fri, 1 Oct 2021 14:52:56 +0200
> Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:
> 
> > On Thu, 30 Sep 2021 15:37:33 +0200
> > Karsten Graul <kgraul@linux.ibm.com> wrote:
> > 
> > > On 14/09/2021 17:45, Ioana Ciornei wrote:
> > > > On Wed, Sep 08, 2021 at 10:33:26PM -0500, Jeremy Linton wrote:
> > > >> +DPAA2, netdev maintainers
> > > >> Hi,
> > > >>
> > > >> On 5/18/21 7:54 AM, Hamza Mahfooz wrote:
> > > >>> Since, overlapping mappings are not supported by the DMA API we should
> > > >>> report an error if active_cacheline_insert returns -EEXIST.
> > > >>
> > > >> It seems this patch found a victim. I was trying to run iperf3 on a
> > > >> honeycomb (5.14.0, fedora 35) and the console is blasting this error message
> > > >> at 100% cpu. So, I changed it to a WARN_ONCE() to get the call trace, which
> > > >> is attached below.
> > > >>
> > > > 
> > > > These frags are allocated by the stack, transformed into a scatterlist
> > > > by skb_to_sgvec and then DMA mapped with dma_map_sg. It was not the
> > > > dpaa2-eth's decision to use two fragments from the same page (that will
> > > > also end un in the same cacheline) in two different in-flight skbs.
> > > > 
> > > > Is this behavior normal?
> > > > 
> > > 
> > > We see the same problem here and it started with 5.15-rc2 in our nightly CI runs.
> > > The CI has panic_on_warn enabled so we see the panic every day now.
> > 
> > Adding a WARN for a case that be detected false-positive seems not
> > acceptable, exactly for this reason (kernel panic on unaffected
> > systems).
> > 
> > So I guess it boils down to the question if the behavior that Ioana
> > described is legit behavior, on a system that is dma coherent. We
> > are apparently hitting the same scenario, although it could not yet be
> > reproduced with debug printks for some reason.
> > 
> > If the answer is yes, than please remove at lease the WARN, so that
> > it will not make systems crash that behave valid, and have
> > panic_on_warn set. Even a normal printk feels wrong to me in that
> > case, it really sounds rather like you want to fix / better refine
> > the overlap check, if you want to report anything here.
> 
> Dan, Christoph, any opinion?
> 
> So far it all looks a lot like a false positive, so could you please
> see that those patches get reverted? I do wonder a bit why this is
> not an issue for others, we surely cannot be the only ones running
> CI with panic_on_warn.

For reference, we are talking about these commits:

2b4bbc6231d7 ("dma-debug: report -EEXIST errors in add_dma_entry")
510e1a724ab1 ("dma-debug: prevent an error message from causing runtime problems")

The latter introduced the WARN (through err_printk usage), and should
be reverted if it can be false-positive, but both seem wrong in that
case.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
