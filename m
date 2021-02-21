Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 50180320AA9
	for <lists.iommu@lfdr.de>; Sun, 21 Feb 2021 14:49:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B28683709
	for <lists.iommu@lfdr.de>; Sun, 21 Feb 2021 13:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzXItZBhOGFe for <lists.iommu@lfdr.de>;
	Sun, 21 Feb 2021 13:49:13 +0000 (UTC)
Received: by smtp1.osuosl.org (Postfix, from userid 1001)
	id 6A2AE835F2; Sun, 21 Feb 2021 13:49:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34D583486;
	Sun, 21 Feb 2021 13:49:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2074C0001;
	Sun, 21 Feb 2021 13:49:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A798C0001
 for <iommu@lists.linux-foundation.org>; Sun, 21 Feb 2021 13:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 461DE605C9
 for <iommu@lists.linux-foundation.org>; Sun, 21 Feb 2021 13:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqIbi74e7jgZ for <iommu@lists.linux-foundation.org>;
 Sun, 21 Feb 2021 13:49:07 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 6485C6ED68; Sun, 21 Feb 2021 13:49:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76975605C9
 for <iommu@lists.linux-foundation.org>; Sun, 21 Feb 2021 13:49:05 +0000 (UTC)
Received: from [192.168.1.176]
 (dynamic-078-055-128-098.78.55.pool.telefonica.de [78.55.128.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 507A22064792E;
 Sun, 21 Feb 2021 14:49:03 +0100 (CET)
Subject: Re: [PATCH] iommu/amd: Fix event counter availability check
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20200529200738.1923-1-amonakov@ispras.ru>
 <56761139-f794-39b1-4dfa-dfc05fbe5f60@amd.com>
 <alpine.LNX.2.20.13.2006011132530.16067@monopod.intra.ispras.ru>
 <dba1e37a-1ed7-ef7f-7252-2ebd1d6bde8c@amd.com>
 <alpine.LNX.2.20.13.2006152346320.21123@monopod.intra.ispras.ru>
 <b01994db-da9b-d8e6-e0c1-1af35dd62191@amd.com>
 <alpine.LNX.2.20.13.2009172052480.29869@monopod.intra.ispras.ru>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <23d42e73-91ac-8f47-af64-40edff8bc027@molgen.mpg.de>
Date: Sun, 21 Feb 2021 14:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.20.13.2009172052480.29869@monopod.intra.ispras.ru>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, Alexander Monakov <amonakov@ispras.ru>,
 linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

RGVhciBTdXJhdmVlLAoKCkFtIDE3LjA5LjIwIHVtIDE5OjU1IHNjaHJpZWIgQWxleGFuZGVyIE1v
bmFrb3Y6Cj4gT24gVHVlLCAxNiBKdW4gMjAyMCwgU3VyYXZlZSBTdXRoaWt1bHBhbml0IHdyb3Rl
Ogo+IAo+Pj4+IEluc3RlYWQgb2YgYmxpbmRseSBtb3ZpbmcgdGhlIGNvZGUgYXJvdW5kIHRvIGEg
c3BvdCB0aGF0IHdvdWxkIGp1c3Qgd29yaywKPj4+PiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5k
IHdoYXQgbWlnaHQgYmUgcmVxdWlyZWQgaGVyZS4gSW4gdGhpcyBjYXNlLAo+Pj4+IHRoZSBpbml0
X2RldmljZV90YWJsZV9kbWEoKXNob3VsZCBub3QgYmUgbmVlZGVkLiBJIHN1c3BlY3QgaXQncyB0
aGUgSU9NTVUKPj4+PiBpbnZhbGlkYXRlIGFsbCBjb21tYW5kIHRoYXQncyBhbHNvIG5lZWRlZCBo
ZXJlLgo+Pj4+Cj4+Pj4gSSdtIGFsc28gY2hlY2tpbmcgd2l0aCB0aGUgSFcgYW5kIEJJT1MgdGVh
bS4gTWVhbndoaWxlLCBjb3VsZCB5b3UgcGxlYXNlCj4+Pj4gZ2l2ZQo+Pj4+IHRoZSBmb2xsb3dp
bmcgY2hhbmdlIGEgdHJ5Ogo+Pj4gSGVsbG8uIENhbiB5b3UgZ2l2ZSBhbnkgdXBkYXRlIHBsZWFz
ZT8KClvigKZdCgo+PiBTb3JyeSBmb3IgbGF0ZSByZXBseS4gSSBoYXZlIGEgcmVwcm9kdWNlciBh
bmQgd29ya2luZyB3aXRoIHRoZSBIVyB0ZWFtIHRvCj4+IHVuZGVyc3RhbmQgdGhlIGlzc3VlLgo+
PiBJIHNob3VsZCBiZSBhYmxlIHRvIHByb3ZpZGUgdXBkYXRlIHdpdGggc29sdXRpb24gYnkgdGhl
IGVuZCBvZiB0aGlzIHdlZWsuCj4gCj4gSGVsbG8sIGhvcGUgeW91IGFyZSBkb2luZyB3ZWxsLiBI
YXMgdGhpcyBpbnZlc3RpZ2F0aW9uIGZvdW5kIGFueXRoaW5nPwoKSSBhbSB3b25kZXJpbmcgdGhl
IHNhbWUuIEl04oCZZCBiZSBncmVhdCB0byBoYXZlIHRoaXMgZml4ZWQgaW4gdGhlIAp1cHN0cmVh
bSBMaW51eCBrZXJuZWwuCgoKS2luZCByZWdhcmRzLAoKUGF1bApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vaW9tbXU=
