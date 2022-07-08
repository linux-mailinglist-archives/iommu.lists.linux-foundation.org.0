Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4070656CD75
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFA9481417;
	Sun, 10 Jul 2022 06:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFA9481417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rurxc4MLH_xB; Sun, 10 Jul 2022 06:37:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A1A4C8297F;
	Sun, 10 Jul 2022 06:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A4C8297F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05D6AC0086;
	Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5702EC002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB4C2405F3
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB4C2405F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsy2CUtPyX6C for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 16:17:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C85934050C
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C85934050C
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:17:11 +0000 (UTC)
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Lfdbm5bSbz686M3;
 Sat,  9 Jul 2022 00:12:52 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 18:17:08 +0200
Received: from [10.195.34.23] (10.195.34.23) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 8 Jul
 2022 17:17:07 +0100
Message-ID: <5fd4814a-81b1-0e71-58e0-57a747eb684e@huawei.com>
Date: Fri, 8 Jul 2022 17:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v5 0/5] DMA mapping changes for SCSI core
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Christoph Hellwig
 <hch@lst.de>
References: <1656590892-42307-1-git-send-email-john.garry@huawei.com>
 <b5f80062-e8ef-9597-1b0c-393140950dfb@huawei.com>
 <20220706134447.GA23753@lst.de> <yq1y1x47jgn.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1y1x47jgn.fsf@ca-mkp.ca.oracle.com>
X-Originating-IP: [10.195.34.23]
X-ClientProxiedBy: lhreml748-chm.china.huawei.com (10.201.108.198) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: iommu@lists.linux.dev, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
 will@kernel.org, damien.lemoal@opensource.wdc.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com, linux-ide@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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
From: John Garry via iommu <iommu@lists.linux-foundation.org>
Reply-To: John Garry <john.garry@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gMDcvMDcvMjAyMiAyMTozNSwgTWFydGluIEsuIFBldGVyc2VuIHdyb3RlOgo+IENocmlzdG9w
aCwKPiAKPj4gWWVzLCBJJ3ZlIG1vc3RseSBiZWVuIHdhaXRpbmcgZm9yIGFuIEFDSyBmcm9tIE1h
cnRpbi4KPiBTb3JyeSwgSSdtIG9uIHZhY2F0aW9uIHRoaXMgd2Vlay4gVGhlIHNlcmllcyBsb29r
cyBPSyB0byBtZSBhbHRob3VnaCBJCj4gZG8gYWdyZWUgdGhhdCBpdCB3b3VsZCBiZSBncmVhdCBp
ZiB0aGUgbWF4IHdhcyByZWZsZWN0ZWQgaW4gdGhlIHF1ZXVlJ3MKPiBoYXJkIGxpbWl0IGFuZCBv
cHQgaW4gdGhlIHNvZnQgbGltaXQuCgpBaCwgSSB0aGluayB0aGF0IEkgbWlzdW5kZXJzdG9vZCBE
YW1pZW4ncyBxdWVzdGlvbi4gSSB0aG91Z2h0IGhlIHdhcyAKYXNraW5nIHdoeSBub3Qga2VlcCBz
aG9zdCBtYXhfc2VjdG9ycyBhdCBkbWFfbWF4X21hcHBpbmdfc2l6ZSgpIGFuZCB0aGVuIAppbml0
IGVhY2ggc2RldiByZXF1ZXN0IHF1ZXVlIG1heCBodyBzZWN0b3JzIGF0IGRtYV9vcHRfbWFwcGlu
Z19zaXplKCkuCgpCdXQgaGUgc2VlbXMgdGhhdCB5b3Ugd2FudCB0byBrbm93IHdoeSBub3QgaGF2
ZSB0aGUgcmVxdWVzdCBxdWV1ZSBtYXggCnNlY3RvcnMgYXQgZG1hX29wdF9tYXBwaW5nX3NpemUo
KS4gVGhlIGFuc3dlciBpcyByZWxhdGVkIHRvIG1lYW5pbmcgb2YgCmRtYV9vcHRfbWFwcGluZ19z
aXplKCkuIElmIHdlIGdldCBhbnkgbWFwcGluZ3Mgd2hpY2ggZXhjZWVkIHRoaXMgc2l6ZSAKdGhl
biBpdCBjYW4gaGF2ZSBhIGJpZyBkbWEgbWFwcGluZyBwZXJmb3JtYW5jZSBoaXQuIFNvIEkgc2V0
IG1heCBodyAKc2VjdG9ycyBhdCB0aGlzIOKAmG9wdOKAmSBtYXBwaW5nIHNpemUgdG8gZW5zdXJl
IHRoYXQgd2UgZ2V0IG5vIG1hcHBpbmdzIAp3aGljaCBleGNlZWQgdGhpcyBzaXplLiBJbmRlZWQs
IEkgdGhpbmsgbWF4IHNlY3RvcnMgaXMgMTI4S2IgdG9kYXkgZm9yIApteSBob3N0LCB3aGljaCB3
b3VsZCBiZSBzYW1lIGFzIGRtYV9vcHRfbWFwcGluZ19zaXplKCkgdmFsdWUgd2l0aCBhbiAKSU9N
TVUgZW5hYmxlZC4gQW5kIEkgZmluZCB0aGF0IG9ubHkgYSBzbWFsbCAlIG9mIHJlcXVlc3Qgc2l6
ZSBtYXkgZXhjZWVkIAp0aGlzIDEyOGtiIHNpemUsIGJ1dCBpdCBzdGlsbCBoYXMgYSBiaWcgcGVy
Zm9ybWFuY2UgaW1wYWN0LgoKPiAKPiBBY2tlZC1ieTogTWFydGluIEsuIFBldGVyc2VuPG1hcnRp
bi5wZXRlcnNlbkBvcmFjbGUuY29tPgoKVGhhbmtzLApKb2huCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby9pb21tdQ==
