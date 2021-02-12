Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E62319A2B
	for <lists.iommu@lfdr.de>; Fri, 12 Feb 2021 08:19:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 127A76F644
	for <lists.iommu@lfdr.de>; Fri, 12 Feb 2021 07:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrVOhYPuBtjd for <lists.iommu@lfdr.de>;
	Fri, 12 Feb 2021 07:19:14 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id C4DCF6F5EC; Fri, 12 Feb 2021 07:19:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A7B06F56E;
	Fri, 12 Feb 2021 07:19:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40E59C013A;
	Fri, 12 Feb 2021 07:19:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79EC2C013A
 for <iommu@lists.linux-foundation.org>; Fri, 12 Feb 2021 07:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 68F8E85EA8
 for <iommu@lists.linux-foundation.org>; Fri, 12 Feb 2021 07:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7t8jrhxkAfll for <iommu@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 07:19:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2082485FAC
 for <iommu@lists.linux-foundation.org>; Fri, 12 Feb 2021 07:19:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86BA7113E;
 Thu, 11 Feb 2021 23:19:07 -0800 (PST)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E2C83F73D;
 Thu, 11 Feb 2021 23:19:03 -0800 (PST)
Subject: Re: [PATCH 3/3] dma-contiguous: Type cast MAX_ORDER as unsigned int
To: Christoph Hellwig <hch@lst.de>
References: <1613024531-19040-1-git-send-email-anshuman.khandual@arm.com>
 <1613024531-19040-4-git-send-email-anshuman.khandual@arm.com>
 <20210211080417.GC14448@lst.de>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <cb6b039a-5a8f-b2c4-2c9e-bcd973ba6232@arm.com>
Date: Fri, 12 Feb 2021 12:49:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211080417.GC14448@lst.de>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, catalin.marinas@arm.com,
 akpm@linux-foundation.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

CgpPbiAyLzExLzIxIDE6MzQgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIFRodSwg
RmViIDExLCAyMDIxIGF0IDExOjUyOjExQU0gKzA1MzAsIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3Rl
Ogo+PiBUeXBlIGNhc3QgTUFYX09SREVSIGFzIHVuc2lnbmVkIGludCB0byBmaXggdGhlIGZvbGxv
d2luZyBidWlsZCB3YXJuaW5nLgo+Pgo+PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRl
L2xpbnV4L2tlcm5lbC5oOjE0LAo+PiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2Fz
bS1nZW5lcmljL2J1Zy5oOjIwLAo+PiAgICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL2FybTY0
L2luY2x1ZGUvYXNtL2J1Zy5oOjI2LAo+PiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRl
L2xpbnV4L2J1Zy5oOjUsCj4+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgv
bW1kZWJ1Zy5oOjUsCj4+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vbWVtb3J5Lmg6MTY2LAo+PiAgICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL2FybTY0
L2luY2x1ZGUvYXNtL3BhZ2UuaDo0MiwKPj4gICAgICAgICAgICAgICAgICBmcm9tIGtlcm5lbC9k
bWEvY29udGlndW91cy5jOjQ2Ogo+PiBrZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYzogSW4gZnVuY3Rp
b24g4oCYcm1lbV9jbWFfc2V0dXDigJk6Cj4+IC4vaW5jbHVkZS9saW51eC9taW5tYXguaDoxODoy
ODogd2FybmluZzogY29tcGFyaXNvbiBvZiBkaXN0aW5jdCBwb2ludGVyCj4+IHR5cGVzIGxhY2tz
IGEgY2FzdAo+PiAgICghIShzaXplb2YoKHR5cGVvZih4KSAqKTEgPT0gKHR5cGVvZih5KSAqKTEp
KSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cj4+IC4vaW5jbHVkZS9saW51eC9t
aW5tYXguaDozMjo0OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX190eXBlY2hlY2vi
gJkKPj4gICAgKF9fdHlwZWNoZWNrKHgsIHkpICYmIF9fbm9fc2lkZV9lZmZlY3RzKHgsIHkpKQo+
PiAgICAgXn5+fn5+fn5+fn4KPj4gLi9pbmNsdWRlL2xpbnV4L21pbm1heC5oOjQyOjI0OiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19zYWZlX2NtcOKAmQo+PiAgIF9fYnVpbHRpbl9j
aG9vc2VfZXhwcihfX3NhZmVfY21wKHgsIHkpLCBcCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn4KPj4gLi9pbmNsdWRlL2xpbnV4L21pbm1heC5oOjU4OjE5OiBub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8KPj4g4oCYX19jYXJlZnVsX2NtcOKAmQo+PiAgI2RlZmluZSBtYXgo
eCwgeSkgX19jYXJlZnVsX2NtcCh4LCB5LCA+KQo+PiAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fgo+PiBrZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYzo0MDI6MzU6IG5vdGU6IGluIGV4cGFu
c2lvbiBvZiBtYWNybyDigJhtYXjigJkKPj4gICBwaHlzX2FkZHJfdCBhbGlnbiA9IFBBR0VfU0la
RSA8PCBtYXgoTUFYX09SREVSIC0gMSwgcGFnZWJsb2NrX29yZGVyKTsKPj4KPj4gQ2M6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+PiBDYzogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlw
cm93c2tpQHNhbXN1bmcuY29tPgo+PiBDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4KPj4gQ2M6IGlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCj4+IENjOiBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEtoYW5k
dWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgo+PiAtLS0KPj4gIGtlcm5lbC9kbWEvY29u
dGlndW91cy5jIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYyBiL2tl
cm5lbC9kbWEvY29udGlndW91cy5jCj4+IGluZGV4IDNkNjNkOTFjYmE1Yy4uMWMyNzgyMzQ5ZDcx
IDEwMDY0NAo+PiAtLS0gYS9rZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYwo+PiArKysgYi9rZXJuZWwv
ZG1hL2NvbnRpZ3VvdXMuYwo+PiBAQCAtMzk5LDcgKzM5OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcmVzZXJ2ZWRfbWVtX29wcyBybWVtX2NtYV9vcHMgPSB7Cj4+ICAKPj4gIHN0YXRpYyBpbnQg
X19pbml0IHJtZW1fY21hX3NldHVwKHN0cnVjdCByZXNlcnZlZF9tZW0gKnJtZW0pCj4+ICB7Cj4+
IC0JcGh5c19hZGRyX3QgYWxpZ24gPSBQQUdFX1NJWkUgPDwgbWF4KE1BWF9PUkRFUiAtIDEsIHBh
Z2VibG9ja19vcmRlcik7Cj4+ICsJcGh5c19hZGRyX3QgYWxpZ24gPSBQQUdFX1NJWkUgPDwgbWF4
KCh1bnNpZ25lZCBpbnQpTUFYX09SREVSIC0gMSwgcGFnZWJsb2NrX29yZGVyKTsKPiAKPiBNQVhf
T1JERVIgYW5kIHBhZ2VibG9ja19vcmRlciBzaG91bGQgYmUgdGhlIHNhbWUgdHlwZS4gIFNvIGVp
dGhlciBmaXgKClJpZ2h0LgoKPiBNQVhfT1JERVIgdG8gYmUgYW4gdW5zaWduZWQgY29uc3RhbnQs
IHdoaWNoIHdvdWxkIGJlIGZ1bmRhbWVudGFsbHkKPiB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gYnV0
IG1pZ2h0IGNhdXNlIHNvbWUgZmFsbG91dCwgb3IgdHVybgo+IHBhZ2VibG9ja19vcmRlciBpbnRv
IGFuIGludCwgd2hpY2ggaXMgcHJvYmFibHkgbXVjaCBlaXRoZXIgYXMgdGhlIHN0dWIKPiBkZWZp
bmUgb2YgaXQgYWxyZWFkeSBoYXMgYW4gaW50ZWdlciB0eXBlIGRlcml2ZWQgZnJvbSBNQVhfT1JE
RVIgYXMgd2VsbC4KClJpZ2h0LCB3aWxsIGNoYW5nZSBwYWdlYmxvY2tfb3JkZXIgYXMgJ2ludCcg
d2hpY2ggd291bGQgYmUgZWFzaWVyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW9tbXU=
