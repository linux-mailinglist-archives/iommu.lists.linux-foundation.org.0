Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBE740AA48
	for <lists.iommu@lfdr.de>; Tue, 14 Sep 2021 11:11:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA6580E34;
	Tue, 14 Sep 2021 09:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opgsPvQgA9XR; Tue, 14 Sep 2021 09:11:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 24E3680E31;
	Tue, 14 Sep 2021 09:11:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E778DC001E;
	Tue, 14 Sep 2021 09:11:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74AC6C000D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 09:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E2564032F
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 09:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XujOPhBfnjjK for <iommu@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 09:11:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CB7740299
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 09:11:00 +0000 (UTC)
Received: from [192.168.0.4] (ip5f5ae900.dynamic.kabel-deutschland.de
 [95.90.233.0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7C18061E64761;
 Tue, 14 Sep 2021 11:10:57 +0200 (CEST)
Subject: Re: AMD-Vi: [Firmware Warn]: EFR mismatch. Use IVHD EFR
 (0xf77ef22294ada : 0x400f77ef22294ada).
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
References: <16533743-de8d-6355-211d-1b4f8949fcfb@molgen.mpg.de>
Message-ID: <2f5b07e4-5492-330b-b057-55230639cd5e@molgen.mpg.de>
Date: Tue, 14 Sep 2021 11:10:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16533743-de8d-6355-211d-1b4f8949fcfb@molgen.mpg.de>
Content-Language: en-US
Cc: David Coe <david.coe@live.co.uk>, Robert Richter <rrichter@amd.com>,
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

W0NjOiArRGVsbCBMaW51eCBrZXJuZWwgY2xpZW50IHRlYW1dCgoKRGVhciBMaW51eCBmb2xrcywK
CgpBbSAxMi4wNC4yMSB1bSAyMDowNyBzY2hyaWViIFBhdWwgTWVuemVsOgoKPiBPbiB0aGUgRGVs
bCBPcHRpUGxleCA1MDU1LCBMaW51eCB3YXJucyBhYm91dCBhbiBFRlIgbWlzbWF0Y2ggaW4gdGhl
IAo+IGZpcm13YXJlLgo+IAo+IGBgYAo+IFvigKZdCj4gW8KgwqDCoCAwLjAwMDAwMF0gRE1JOiBE
ZWxsIEluYy4gT3B0aVBsZXggNTA1NSBSeXplbiBDUFUvMFAwM0RYLCBCSU9TIDEuMS4yMCAwNS8z
MS8yMDE5Cj4gW+KApl0KPiBbwqDCoMKgIDEuNDc5Nzc0XSBzbXBib290OiBDUFUwOiBBTUQgUnl6
ZW4gNSBQUk8gMTUwMCBRdWFkLUNvcmUgUHJvY2Vzc29yIChmYW1pbHk6IDB4MTcsIG1vZGVsOiAw
eDEsIHN0ZXBwaW5nOiAweDEpCj4gW+KApl0KPiBbwqDCoMKgIDIuNTA3MzcwXSBBTUQtVmk6IFtG
aXJtd2FyZSBXYXJuXTogRUZSIG1pc21hdGNoLiBVc2UgSVZIRCBFRlIgKDB4Zjc3ZWYyMjI5NGFk
YSA6IDB4NDAwZjc3ZWYyMjI5NGFkYSkuCj4gW8KgwqDCoCAyLjUwNzM4MV0gcGNpIDAwMDA6MDA6
MDAuMjogQU1ELVZpOiBJT01NVSBwZXJmb3JtYW5jZSBjb3VudGVycyBzdXBwb3J0ZWQKPiBbwqDC
oMKgIDIuNTI1MjIxXSBwY2kgMDAwMDowMDowMC4yOiBjYW4ndCBkZXJpdmUgcm91dGluZyBmb3Ig
UENJIElOVCBBCj4gW8KgwqDCoCAyLjUzMTI0MF0gcGNpIDAwMDA6MDA6MDAuMjogUENJIElOVCBB
OiBub3QgY29ubmVjdGVkCj4gW8KgwqDCoCAyLjUzNjQxNV0gcGNpIDAwMDA6MDA6MDEuMDogQWRk
aW5nIHRvIGlvbW11IGdyb3VwIDAKPiBbwqDCoMKgIDIuNTQxNDg1XSBwY2kgMDAwMDowMDowMS4z
OiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAgMQo+IFvigKZdCj4gYGBgCj4gCj4gVGhlIGRpZmZlcmVu
Y2UgaW4gdGhlIE1NSU8gdmFsdWUgaXMgYSBwcmVwZW5kZWQgMHg0MDAuIENhbiB0aGF0IGJlIAo+
IGV4cGxhaW5lZCBzb21laG93Pwo+IAo+IElmIG5vdCwgaXTigJlkIGJlIGdyZWF0LCBpZiB5b3Ug
Y291bGQgZ2l2ZSBtb3JlIGRldGFpbHMgYWJvdXQgdGhlIGZpcm13YXJlIAo+IGlzc3VlLCBzbyBJ
IGNhbiBjb250YWN0IHRoZSBEZWxsIHN1cHBvcnQgdG8gZml4IHRoZSBmaXJtd2FyZS4KCkxpbnV4
IDUuMTUtcmMxIHN0aWxsIHdhcm5zIGFib3V0IHRoYXQgKGFsc28gd2l0aCBsYXRlc3Qgc3lzdGVt
IGZpcm13YXJlIAoxLjEuNTApLgoKCktpbmQgcmVnYXJkcywKClBhdWwKCgo+IFsxXTogaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L2NvbW1pdC8/aWQ9YTQ0MDkyZTMyNmQ0MDNjNzg3ODAxOGJhNTMyMzY5Zjg0ZDMxZGJmYQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWls
aW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
