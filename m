Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A0946446D75
	for <lists.iommu@lfdr.de>; Sat,  6 Nov 2021 11:42:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41FE5827A8;
	Sat,  6 Nov 2021 10:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVFa_Oh4Vd8H; Sat,  6 Nov 2021 10:42:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 298A982741;
	Sat,  6 Nov 2021 10:42:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7DC0C0036;
	Sat,  6 Nov 2021 10:42:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EB5BC000E
 for <iommu@lists.linux-foundation.org>; Sat,  6 Nov 2021 10:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C79A400CC
 for <iommu@lists.linux-foundation.org>; Sat,  6 Nov 2021 10:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRNqWXlnsF2M for <iommu@lists.linux-foundation.org>;
 Sat,  6 Nov 2021 10:42:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24BEC400A8
 for <iommu@lists.linux-foundation.org>; Sat,  6 Nov 2021 10:42:43 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aef5a.dynamic.kabel-deutschland.de
 [95.90.239.90])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id B7FB861EA191C;
 Sat,  6 Nov 2021 11:42:40 +0100 (CET)
Message-ID: <d34f83ad-63a0-8cd1-1246-d0e50c03f42e@molgen.mpg.de>
Date: Sat, 6 Nov 2021 11:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: How to reduce PCI initialization from 5 s (1.5 s adding them to
 IOMMU groups)
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20211105185304.GA936068@bhelgaas>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20211105185304.GA936068@bhelgaas>
Cc: linux-pci@vger.kernel.org, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>
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

RGVhciBCam9ybiwKCgpUaGFuayB5b3UgZm9yIHlvdXIgcXVpY2sgcmVwbHkuCgoKQW0gMDUuMTEu
MjEgdW0gMTk6NTMgc2NocmllYiBCam9ybiBIZWxnYWFzOgo+IE9uIEZyaSwgTm92IDA1LCAyMDIx
IGF0IDEyOjU2OjA5UE0gKzAxMDAsIFBhdWwgTWVuemVsIHdyb3RlOgoKPj4gT24gYSBQb3dlckVk
Z2UgVDQ0MC8wMjFLQ0QsIEJJT1MgMi4xMS4yIDA0LzIyLzIwMjEsIExpbnV4IDUuMTAuNzAgdGFr
ZXMKPj4gYWxtb3N0IGZpdmUgc2Vjb25kcyB0byBpbml0aWFsaXplIFBDSS4gQWNjb3JkaW5nIHRv
IHRoZSB0aW1lc3RhbXBzLCAxLjUgcwo+PiBhcmUgZnJvbSBhc3NpZ25pbmcgdGhlIFBDSSBkZXZp
Y2VzIHRvIHRoZSAxNDIgSU9NTVUgZ3JvdXBzLgo+Pgo+PiBgYGAKPj4gJCBsc3BjaSB8IHdjIC1s
Cj4+IDI4MQo+PiAkIGRtZXNnCj4+IFvigKZdCj4+IFsgICAgMi45MTg0MTFdIFBDSTogVXNpbmcg
aG9zdCBicmlkZ2Ugd2luZG93cyBmcm9tIEFDUEk7IGlmIG5lY2Vzc2FyeSwgdXNlICJwY2k9bm9j
cnMiIGFuZCByZXBvcnQgYSBidWcKPj4gWyAgICAyLjkzMzg0MV0gQUNQSTogRW5hYmxlZCA1IEdQ
RXMgaW4gYmxvY2sgMDAgdG8gN0YKPj4gWyAgICAyLjk3MzczOV0gQUNQSTogUENJIFJvb3QgQnJp
ZGdlIFtQQzAwXSAoZG9tYWluIDAwMDAgW2J1cyAwMC0xNl0pCj4+IFsgICAgMi45ODAzOThdIGFj
cGkgUE5QMEEwODowMDogX09TQzogT1Mgc3VwcG9ydHMgW0V4dGVuZGVkQ29uZmlnIEFTUE0gQ2xv
Y2tQTSBTZWdtZW50cyBNU0kgSFBYLVR5cGUzXQo+PiBbICAgIDIuOTg5NDU3XSBhY3BpIFBOUDBB
MDg6MDA6IF9PU0M6IHBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgW0xUUl0KPj4gWyAgICAyLjk5
NTQ1MV0gYWNwaSBQTlAwQTA4OjAwOiBfT1NDOiBPUyBub3cgY29udHJvbHMgW1BNRSBQQ0llQ2Fw
YWJpbGl0eV0KPj4gWyAgICAzLjAwMTM5NF0gYWNwaSBQTlAwQTA4OjAwOiBGQURUIGluZGljYXRl
cyBBU1BNIGlzIHVuc3VwcG9ydGVkLCB1c2luZyBCSU9TIGNvbmZpZ3VyYXRpb24KPj4gWyAgICAz
LjAxMDUxMV0gUENJIGhvc3QgYnJpZGdlIHRvIGJ1cyAwMDAwOjAwCj4+IFvigKZdCj4+IFsgICAg
Ni4yMzM1MDhdIHN5c3RlbSAwMDowNTogW2lvICAweDEwMDAtMHgxMGZlXSBoYXMgYmVlbiByZXNl
cnZlZAo+PiBbICAgIDYuMjM5NDIwXSBzeXN0ZW0gMDA6MDU6IFBsdWcgYW5kIFBsYXkgQUNQSSBk
ZXZpY2UsIElEcyBQTlAwYzAyIChhY3RpdmUpCj4+IFsgICAgNi4yMzk5MDZdIHBucDogUG5QIEFD
UEk6IGZvdW5kIDYgZGV2aWNlcwo+IAo+IEZvciB+MjgwIFBDSSBkZXZpY2VzLCAoNi4yNC0yLjky
KS8yODAgPSAwLjAxMiBzL2Rldi4gIE9uIG15IGxhcHRvcCBJCj4gaGF2ZSBhYm91dCAoLjY2LS4z
NykvMzYgPSAwLjAwOCBzL2RldiAob24gdjUuNCksIHNvIGFib3V0IHRoZSBzYW1lCj4gYmFsbHBh
cmsuCgpUaG91Z2ggaWYgaXQgd2FzIG9uIGF2ZXJhZ2UgMC4wMDggcy9kZXYgaGVyZSwgYXJvdW5k
IGEgc2Vjb25kIGNvdWxkIGJlIApzYXZlZC4KClRoZSBpbnRlZ3JhdGVkIE1hdHJveCBHMjAwZVcz
IGdyYXBoaWNzIGNvbnRyb2xsZXIgKDEwMmI6MDUzNikgYW5kIHRoZSAKdHdvIEJyb2FkY29tIE5l
dFh0cmVtZSBCQ001NzIwIDItcG9ydCBHaWdhYml0IEV0aGVybmV0IFBDSWUgY2FyZHMgCigxNGU0
OjE2NWYpIHRha2UgMTUwIG1zIHRvIGJlIGluaXRpYWxpemVkLgoKICAgICBbICAgIDMuNDU0NDA5
XSBwY2kgMDAwMDowMzowMC4wOiBbMTAyYjowNTM2XSB0eXBlIDAwIGNsYXNzIDB4MDMwMDAwCiAg
ICAgWyAgICAzLjQ2MDQxMV0gcGNpIDAwMDA6MDM6MDAuMDogcmVnIDB4MTA6IFttZW0gCjB4OTEw
MDAwMDAtMHg5MWZmZmZmZiBwcmVmXQogICAgIFsgICAgMy40Njc0MDNdIHBjaSAwMDAwOjAzOjAw
LjA6IHJlZyAweDE0OiBbbWVtIDB4OTI4MDgwMDAtMHg5MjgwYmZmZl0KICAgICBbICAgIDMuNDcz
NDAyXSBwY2kgMDAwMDowMzowMC4wOiByZWcgMHgxODogW21lbSAweDkyMDAwMDAwLTB4OTI3ZmZm
ZmZdCiAgICAgWyAgICAzLjQ3OTQzN10gcGNpIDAwMDA6MDM6MDAuMDogQkFSIDA6IGFzc2lnbmVk
IHRvIGVmaWZiCgpUaGUgdGltZXN0YW1wIGluIGVhY2ggbGluZSBkaWZmZXJzIGJ5IGFyb3VuZCA2
IG1zLiBDb3VsZCBwcmludGluZyB0aGUgCm1lc3NhZ2VzIHRvIHRoZSBjb25zb2xlIChWR0EpIGhv
bGQgdGhpcyB1cCAobGluZSAzNzMgdG8gbGluZSA5MTEgbWFrZXMgCig2LjI0IHMtMi45MiBzKS8o
NTM4IGxpbmVzKSA9ICgzLjMyIHMpLyg1MzggbGluZXMpID0gNiBtcyk/CgogICAgIFsgICAgMy40
ODQ0ODBdIHBjaSAwMDAwOjAyOjAwLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwM10KICAgICBbICAg
IDMuNDg5NDAxXSBwY2kgMDAwMDowMjowMC4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAKMHg5MjAw
MDAwMC0weDkyOGZmZmZmXQogICAgIFsgICAgMy40OTYzOThdIHBjaSAwMDAwOjAyOjAwLjA6ICAg
YnJpZGdlIHdpbmRvdyBbbWVtIAoweDkxMDAwMDAwLTB4OTFmZmZmZmYgNjRiaXQgcHJlZl0KICAg
ICBbICAgIDMuNTA0NDQ2XSBwY2kgMDAwMDowNDowMC4wOiBbMTRlNDoxNjVmXSB0eXBlIDAwIGNs
YXNzIDB4MDIwMDAwCiAgICAgWyAgICAzLjUxMDQxNV0gcGNpIDAwMDA6MDQ6MDAuMDogcmVnIDB4
MTA6IFttZW0gCjB4OTJlMzAwMDAtMHg5MmUzZmZmZiA2NGJpdCBwcmVmXQogICAgIFsgICAgMy41
MTc0MDhdIHBjaSAwMDAwOjA0OjAwLjA6IHJlZyAweDE4OiBbbWVtIAoweDkyZTQwMDAwLTB4OTJl
NGZmZmYgNjRiaXQgcHJlZl0KICAgICBbICAgIDMuNTI0NDA3XSBwY2kgMDAwMDowNDowMC4wOiBy
ZWcgMHgyMDogW21lbSAKMHg5MmU1MDAwMC0weDkyZTVmZmZmIDY0Yml0IHByZWZdCiAgICAgWyAg
ICAzLjUzMjQwMl0gcGNpIDAwMDA6MDQ6MDAuMDogcmVnIDB4MzA6IFttZW0gCjB4ZmZmYzAwMDAt
MHhmZmZmZmZmZiBwcmVmXQogICAgIFsgICAgMy41Mzg0ODNdIHBjaSAwMDAwOjA0OjAwLjA6IFBN
RSMgc3VwcG9ydGVkIGZyb20gRDAgRDNob3QgRDNjb2xkCiAgICAgWyAgICAzLjU0NDQzN10gcGNp
IDAwMDA6MDQ6MDAuMDogNC4wMDAgR2IvcyBhdmFpbGFibGUgUENJZSAKYmFuZHdpZHRoLCBsaW1p
dGVkIGJ5IDUuMCBHVC9zIFBDSWUgeDEgbGluayBhdCAwMDAwOjAwOjFjLjUgKGNhcGFibGUgb2Yg
CjguMDAwIEdiL3Mgd2l0aCA1LjAgR1QvcyBQQ0llIHgyIGxpbmspCiAgICAgWyAgICAzLjU1OTQ5
M10gcGNpIDAwMDA6MDQ6MDAuMTogWzE0ZTQ6MTY1Zl0gdHlwZSAwMCBjbGFzcyAweDAyMDAwMAoK
SGVyZSBpcyBhIDE1IG1zIGRlbGF5LgoKICAgICBbICAgIDMuNTY1NDE1XSBwY2kgMDAwMDowNDow
MC4xOiByZWcgMHgxMDogW21lbSAKMHg5MmUwMDAwMC0weDkyZTBmZmZmIDY0Yml0IHByZWZdCiAg
ICAgWyAgICAzLjU3MzQwN10gcGNpIDAwMDA6MDQ6MDAuMTogcmVnIDB4MTg6IFttZW0gCjB4OTJl
MTAwMDAtMHg5MmUxZmZmZiA2NGJpdCBwcmVmXQogICAgIFsgICAgMy41ODA0MDddIHBjaSAwMDAw
OjA0OjAwLjE6IHJlZyAweDIwOiBbbWVtIAoweDkyZTIwMDAwLTB4OTJlMmZmZmYgNjRiaXQgcHJl
Zl0KICAgICBbICAgIDMuNTg3NDAyXSBwY2kgMDAwMDowNDowMC4xOiByZWcgMHgzMDogW21lbSAK
MHhmZmZjMDAwMC0weGZmZmZmZmZmIHByZWZdCiAgICAgWyAgICAzLjU5NDQ4M10gcGNpIDAwMDA6
MDQ6MDAuMTogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEMCBEM2hvdCBEM2NvbGQKICAgICBbICAgIDMu
NjAwNTAyXSBwY2kgMDAwMDowMDoxYy41OiBQQ0kgYnJpZGdlIHRvIFtidXMgMDRdCgpDYW4gdGhl
IDYgbXMg4oCTIGFsc28gZnJvbSB5b3VyIHN5c3RlbSDigJMgYmUgZXhwbGFpbmVkIGJ5IHRoZSBQ
Q0kgCnNwZWNpZmljYXRpb24/IFNlZWluZyBob3cgZmFzdCBQQ0kgbm93YWRheXMgaXMsIDYgbXMg
c291bmRzIGxpa2UgYSBsb25nIAp0aW1lLiA7LSkKCj4gRmFzdGVyIHdvdWxkIGFsd2F5cyBiZSBi
ZXR0ZXIsIG9mIGNvdXJzZS4gIEkgYXNzdW1lIHRoaXMgaXMgbm90IHJlYWxseQo+IGEgcmVncmVz
c2lvbj8KCkNvcnJlY3QsIGFzIGZhciBhcyBJIGtub3cgb2YsIHRoaXMgaXMgbm8gcmVncmVzc2lv
bi4KCj4+IFsgICAgNi45ODkwMTZdIHBjaSAwMDAwOmQ3OjA1LjA6IGRpc2FibGVkIGJvb3QgaW50
ZXJydXB0cyBvbiBkZXZpY2UgWzgwODY6MjAzNF0KPj4gWyAgICA2Ljk5NjA2M10gUENJOiBDTFMg
MCBieXRlcywgZGVmYXVsdCA2NAo+PiBbICAgIDcuMDAwMDA4XSBUcnlpbmcgdG8gdW5wYWNrIHJv
b3RmcyBpbWFnZSBhcyBpbml0cmFtZnMuLi4KPj4gWyAgICA3LjA2NTI4MV0gRnJlZWluZyBpbml0
cmQgbWVtb3J5OiA1MTM2SwoKVGhlIFBDSSByZXNvdXJjZSBhc3NpZ25tZW50KD8pIGFsc28gc2Vl
bXMgdG8gdGFrZSA2NzAgbXM6CgogICAgIFsgICAgNi4zMTk2NTZdIHBjaSAwMDAwOjA0OjAwLjA6
IGNhbid0IGNsYWltIEJBUiA2IFttZW0gCjB4ZmZmYzAwMDAtMHhmZmZmZmZmZiBwcmVmXTogbm8g
Y29tcGF0aWJsZSBicmlkZ2Ugd2luZG93CiAgICAgW+KApl0KICAgICBbICAgIDYuOTg5MDE2XSBw
Y2kgMDAwMDpkNzowNS4wOiBkaXNhYmxlZCBib290IGludGVycnVwdHMgb24gZGV2aWNlIApbODA4
NjoyMDM0XQoKPj4gW+KApl0KPj4gWyAgICA3LjA3OTA5OF0gRE1BUjogZG1hcjc6IFVzaW5nIFF1
ZXVlZCBpbnZhbGlkYXRpb24KPj4gWyAgICA3LjA4Mzk4M10gcGNpIDAwMDA6MDA6MDAuMDogQWRk
aW5nIHRvIGlvbW11IGdyb3VwIDAKPj4gW+KApl0KPj4gWyAgICA4LjUzNzgwOF0gcGNpIDAwMDA6
ZDc6MTcuMTogQWRkaW5nIHRvIGlvbW11IGdyb3VwIDE0MQo+IAo+IEkgZG9uJ3QgaGF2ZSB0aGlz
IGlvbW11IHN0dWZmIHR1cm5lZCBvbiBhbmQgZG9uJ3Qga25vdyB3aGF0J3MKPiBoYXBwZW5pbmcg
aGVyZS4KClRoZXJlIGlzIGEgbG9jayBpbiBgaW9tbXVfZ3JvdXBfYWRkX2RldmljZSgpYCBpbiBg
ZHJpdmVycy9pb21tdS9pb21tdS5jYDoKCiAgICAgICAgIG11dGV4X2xvY2soJmdyb3VwLT5tdXRl
eCk7CiAgICAgICAgIGxpc3RfYWRkX3RhaWwoJmRldmljZS0+bGlzdCwgJmdyb3VwLT5kZXZpY2Vz
KTsKICAgICAgICAgaWYgKGdyb3VwLT5kb21haW4gICYmICFpb21tdV9pc19hdHRhY2hfZGVmZXJy
ZWQoZ3JvdXAtPmRvbWFpbiwgCmRldikpCiAgICAgICAgICAgICAgICAgcmV0ID0gX19pb21tdV9h
dHRhY2hfZGV2aWNlKGdyb3VwLT5kb21haW4sIGRldik7CiAgICAgICAgIG11dGV4X3VubG9jaygm
Z3JvdXAtPm11dGV4KTsKCk5vIGlkZWEsIGlmIGl04oCZcyByZWxhdGVkLiBVbmZvcnR1bmF0ZWx5
LCBpdOKAmXMgYSBwcm9kdWN0aW9uIHN5c3RlbSwgc28gSSAKY2Fu4oCZdCBkbyBhbnkgZGVidWdn
aW5nLiAoTWF5YmUgYGluaXRjYWxsX2RlYnVnYCBjb3VsZCBnaXZlIHNvbWUgCmluc2lnaHQuKSBN
YXliZSB0aGUgSU9NTVUgZGV2ZWxvcGVycyBjYW4gZXhwbGFpbiBpdCB3aXRob3V0IGl0LiBDb3Vs
ZCAKdGhlIElPTU1VIGdyb3VwIGFzc2lnbm1lbnQgYmUgZG9uZSBpbiBwYXJhbGxlbD8KCj4+IElz
IHRoZXJlIGFueXRoaW5nIHRoYXQgY291bGQgYmUgZG9uZSB0byByZWR1Y2UgdGhlIHRpbWU/CgoK
S2luZCByZWdhcmRzLAoKUGF1bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
aW9tbXU=
