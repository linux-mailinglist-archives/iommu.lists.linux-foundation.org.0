Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A7A40BB09
	for <lists.iommu@lfdr.de>; Wed, 15 Sep 2021 00:15:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E67A403DD;
	Tue, 14 Sep 2021 22:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9RSrclQ8mnL; Tue, 14 Sep 2021 22:15:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A1451403DC;
	Tue, 14 Sep 2021 22:15:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67F54C001E;
	Tue, 14 Sep 2021 22:15:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF4E1C000D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 22:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEAF340375
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 22:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jc5JYYf_Qizn for <iommu@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 22:15:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4ABCA400B9
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 22:15:37 +0000 (UTC)
Received: from [192.168.0.4] (ip5f5ae900.dynamic.kabel-deutschland.de
 [95.90.233.0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id E0CD661E64760;
 Wed, 15 Sep 2021 00:15:33 +0200 (CEST)
Subject: Re: AMD-Vi: [Firmware Warn]: EFR mismatch. Use IVHD EFR
 (0xf77ef22294ada : 0x400f77ef22294ada).
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
References: <16533743-de8d-6355-211d-1b4f8949fcfb@molgen.mpg.de>
 <2f5b07e4-5492-330b-b057-55230639cd5e@molgen.mpg.de>
 <YUCRC0CI7rWXt4VA@8bytes.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <38c22e95-aa19-4166-be8a-28749bfacd3e@molgen.mpg.de>
Date: Wed, 15 Sep 2021 00:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUCRC0CI7rWXt4VA@8bytes.org>
Content-Language: en-US
Cc: David Coe <david.coe@live.co.uk>, Robert Richter <rrichter@amd.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 Alexander Monakov <amonakov@ispras.ru>, iommu@lists.linux-foundation.org,
 Dell.Client.Kernel@dell.com
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

W0NjOiArTWFyaW8gZnJvbSBBTURdCgpEZWFyIErDtnJnLAoKCkFtIDE0LjA5LjIxIHVtIDE0OjA5
IHNjaHJpZWIgSsO2cmcgUsO2ZGVsOgo+IE9uIFR1ZSwgU2VwIDE0LCAyMDIxIGF0IDExOjEwOjU3
QU0gKzAyMDAsIFBhdWwgTWVuemVsIHdyb3RlOgo+PiBMaW51eCA1LjE1LXJjMSBzdGlsbCB3YXJu
cyBhYm91dCB0aGF0IChhbHNvIHdpdGggbGF0ZXN0IHN5c3RlbSBmaXJtd2FyZQo+PiAxLjEuNTAp
Lgo+IAo+IFRoZSByZWFzb24gaXMgbW9zdCBsaWtlbHkgdGhhdCB0aGUgbGF0ZXN0IGZpcm13YXJl
IHN0aWxsIHJlcG9ydHMgYQo+IGRpZmZlcmVudCBFRlIgZmVhdHVyZSBzZXQgaW4gdGhlIElWUlMg
dGFibGUgdGhhbiB0aGUgSU9NTVUgcmVwb3J0cyBpbgo+IGl0cyBFRlIgTU1JTyByZWdpc3Rlci4K
CldoYXQgZG8geW91IG1lYW4gZXhhY3RseT8gT25seSAweDQwMCBpcyBwcmVwZW5kZWQuIFRoZSBy
ZXN0IG9mIHRoZSAKc3RyaW5nIGlzIGlkZW50aWNhbC4gV2hhdCBmZWF0dXJlIHNldCB3b3VsZCB0
aGUgMHg0MDAgaW4gdGhlIGJlZ2lubmluZyBiZT8KCkFueXdheSwgaXTigJlkIGJlIGdyZWF0IGlm
IEFNRCBhbmQgRGVsbCBjb3VsZCB0YWtlIGEgbG9vay4KCgpLaW5kIHJlZ2FyZHMsCgpQYXVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxp
bmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
