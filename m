Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 26950B7997
	for <lists.iommu@lfdr.de>; Thu, 19 Sep 2019 14:36:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6AE7CCD5;
	Thu, 19 Sep 2019 12:36:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DD1D8CC7
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 12:36:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0BBD576D
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 12:36:40 +0000 (UTC)
Received: from guoren-Inspiron-7460.lan (unknown [223.93.147.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BADB920665;
	Thu, 19 Sep 2019 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568896599;
	bh=aolaZhzAEXrggkZsi1c4jkNG7tye6E+Y+uO4aIK3EgQ=;
	h=From:To:Cc:Subject:Date:From;
	b=uWlq+1oLAGmfqdFDuajMDJEk0JKnkqb/HQobWHgGVCm/vWyNzI5amZ+nsSTodTtTf
	Ar30blDLfDHhN03PszMpTegA4ohuSUUy0Ego3wFnHDj27HWC3DcwwseL2J6eMwrw/f
	wfDPOXA+vdxLmMuWXVU7ggMkQzh7oAHmsvd8EYtA=
From: guoren@kernel.org
To: benh@kernel.crashing.org
Subject: [RFC PATCH V1] riscv-privileged: Add broadcast mode to sfence.vma
Date: Thu, 19 Sep 2019 20:35:56 +0800
Message-Id: <1568896556-28769-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: julien.thierry@arm.com, catalin.marinas@arm.com, palmer@sifive.com,
	will.deacon@arm.com, Atish.Patra@wdc.com, julien.grall@arm.com,
	gary@garyguo.net, linux-riscv@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, jean-philippe@linaro.org,
	linux-csky@vger.kernel.org, rppt@linux.ibm.com,
	Guo Ren <ren_guo@c-sky.com>, tech-privileged@lists.riscv.org,
	marc.zyngier@arm.com, linux-arm-kernel@lists.infradead.org,
	feiteng_li@c-sky.com, Anup.Patel@wdc.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	dwmw2@infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

RnJvbTogR3VvIFJlbiA8cmVuX2d1b0BjLXNreS5jb20+CgpUaGUgcGF0Y2ggaXMgZm9yIGh0dHBz
Oi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsCgpUaGUgcHJvcG9zYWwgaGFzIGJl
ZW4gdGFsa2VkIGluIExQQy0yMDE5IFJJU0MtViBNQyByZWYgWzFdLiBIZXJlIGlzIHRoZQpmb3Jt
YWwgcGF0Y2guCgpJbnRyb2R1Y3Rpb24KPT09PT09PT09PT09CgpVc2luZyB0aGUgSGFyZHdhcmUg
VExCIGJyb2FkY2FzdCBpbnZhbGlkYXRpb24gaW5zdHJ1Y3Rpb24gdG8gbWFpbnRhaW4gdGhlCnN5
c3RlbSBUTEIgaXMgYSBnb29kIGNob2ljZSBhbmQgaXQnbGwgc2ltcGxpZnkgdGhlIHN5c3RlbSBz
b2Z0d2FyZSBkZXNpZ24uClRoZSBwcm9wb3NhbCBob3BlcyB0byBhZGQgYSBicm9hZGNhc3QgbW9k
ZSB0byB0aGUgc2ZlbmNlLnZtYSBpbiB0aGUKcmlzY3YtcHJpdmlsZWdlIHNwZWNpZmljYXRpb24u
IFRvIHN1cHBvcnQgdGhlIHNmZW5jZS52bWEgYnJvYWRjYXN0IG1vZGUsCnRoZXJlIGFyZSB0d28g
bW9kaWZpY2F0aW9uIGludHJvZHVjZWQgYmVsb3c6CgogMSkgQWRkIFBHRC5QUE4gKHJvb3QgcGFn
ZSB0YWJsZSdzIFBQTikgYXMgdGhlIHVuaXF1ZSBpZGVudGlmaWVyIG9mIHRoZQogICAgYWRkcmVz
cyBzcGFjZSBpbiBhZGRpdGlvbiB0byBhc2lkL3ZtaWQuIENvbXBhcmVkIHRvIHRoZSBkeW5hbWlj
YWxseQogICAgY2hhbmdlZCBhc2lkL3ZtaWQsIFBHRC5QUE4gaXMgZml4ZWQgdGhyb3VnaG91dCB0
aGUgYWRkcmVzcyBzcGFjZSBsaWZlCiAgICBjeWNsZS4gVGhpcyBmZWF0dXJlIGVuYWJsZXMgdW5p
Zm9ybSBhZGRyZXNzIHNwYWNlIGlkZW50aWZpY2F0aW9uCiAgICBiZXR3ZWVuIGRpZmZlcmVudCBU
TEIgc3lzdGVtcyAoYWN0dWFsbHksIGl0J3MgZGlmZmljdWx0IHRvIHVuaWZ5IHRoZQogICAgYXNp
ZC92bWlkIGJldHdlZW4gdGhlIENQVSBzeXN0ZW0gYW5kIHRoZSBJT01NVSBzeXN0ZW0sIGJlY2F1
c2UgdGhlaXIKICAgIG1lY2hhbmlzbXMgYXJlIGRpZmZlcmVudCkKCiAyKSBNb2RpZnkgdGhlIGRl
ZmluaXRpb24gb2YgdGhlIHNmZW5jZS52bWEgaW5zdHJ1Y3Rpb24gZnJvbSBzeW5jaHJvbm91cwog
ICAgbW9kZSB0byBhc3luY2hyb25vdXMgbW9kZSwgd2hpY2ggbWVhbnMgdGhhdCB0aGUgY29tcGxl
dGlvbiBvZiB0aGUgVExCCiAgICBvcGVyYXRpb24gaXMgbm90IGd1YXJhbnRlZWQgd2hlbiB0aGUg
c2ZlbmNlLnZtYSBpbnN0cnVjdGlvbiByZXRpcmVzLgogICAgSXQgbmVlZHMgdG8gYmUgY29tcGxl
dGVkIGJ5IGNoZWNraW5nIHRoZSBmbGFnIGJpdCBvbiB0aGUgaGFydC4gVGhlCiAgICBzZmVuY2Uu
dm1hIHJlcXVlc3QgZmluaXNoIGNhbiBub3RpZnkgdGhlIHNvZnR3YXJlIGJ5IGdlbmVyYXRpbmcg
YW4KICAgIGludGVycnVwdC4gVGhpcyBmdW5jdGlvbiBhbGxldmlhdGVzIHRoZSBsYXJnZSBkZWxh
eSBvZiBUTEIgaW52YWxpZGF0aW9uCiAgICBpbiB0aGUgUENJIEFUUyBzeXN0ZW0uCgpBZGQgUzEv
UzIuUEdELlBQTiBmb3IgQVNJRC9WTUlECj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
ClBHRCBpcyBnbG9iYWwgZGlyZWN0b3J5IChkZWZpbmVkIGluIGxpbnV4KSBhbmQgUFBOIGlzIHBh
Z2UgcGh5c2ljYWwgbnVtYmVyCihkZWZpbmVkIGluIHJpc2N2LXNwZWMpLiBQR0QuUE5OIGNvcnJl
c3BvbmRzIHRvIHRoZSByb290IHBhZ2UgdGFibGUgcG9pbnRlcgpvZiB0aGUgYWRkcmVzcyBzcGFj
ZSwgaS5lLiBtbS0+cGdkIChsaW51eCBjb25jZXB0KS4KCkluIENQVS9JT01NVSBUTEIsIHdlIHVz
ZSBhc2lkL3ZtaWQgdG8gZGlzdGluZ3Vpc2ggdGhlIGFkZHJlc3Mgc3BhY2Ugb2YKcHJvY2VzcyBv
ciB2aXJ0dWFsIG1hY2hpbmUuIER1ZSB0byB0aGUgbGltaXRhdGlvbiBvZiBpZCBlbmNvZGluZywg
aXQgY2FuCm9ubHkgcmVwcmVzZW50IGEgcGFydCh3aW5kb3cpIG9mIHRoZSBhZGRyZXNzIHNwYWNl
LiBTMS9TMi5QR0QuUFBOIGFyZSB0aGUKcm9vdCBwYWdlIHRhYmxlJ3MgUFBOcyBvZiB0aGUgYWRk
cmVzcyBzcGFjZXMgYW5kIFMxL1MyLlBHRC5QUE4gYXJlIHRoZQp1bmlxdWUgaWRlbnRpZmllciBv
ZiB0aGUgYWRkcmVzcyBzcGFjZXMuCgpGb3IgdGhlIENQVSBTTVAgc3lzdGVtLCB5b3UgY2FuIHVz
ZSBjb250ZXh0IHN3aXRjaCB0byBwZXJmb3JtIHRoZSBuZWNlc3NhcnkKc29mdHdhcmUgbWVjaGFu
aXNtIHRvIGVuc3VyZSB0aGF0IHRoZSBhc2lkL3ZtaWQgb24gYWxsIGhhcnRzIGlzIGNvbnNpc3Rl
bnQKKHBsZWFzZSByZWZlciB0byB0aGUgYXJtNjQgYXNpZCBtZWNoYW5pc20pLiBJbiB0aGlzIHdh
eSwgdGhlIFRMQiBicm9hZGNhc3QKaW52YWxpZGF0aW9uIGluc3RydWN0aW9uIGNhbiBkZXRlcm1p
bmUgdGhlIGFkZHJlc3Mgc3BhY2UgcHJvY2Vzc2VkIG9uIGFsbApoYXJ0cyBieSBhc2lkL3ZtaWQu
CgpEaWZmZXJlbnQgZnJvbSB0aGUgQ1BVIFNNUCBzeXN0ZW0sIHRoZXJlIGlzIG5vIGNvbnRleHQg
c3dpdGNoIGZvciB0aGUKRE1BLUlPTU1VIHN5c3RlbSwgc28gdGhlIHVuaWZpY2F0aW9uIHdpdGgg
dGhlIENQVSBhc2lkL3ZtaWQgY2Fubm90IGJlCmd1YXJhbnRlZWQuIFNvIHdlIG5lZWQgYSB1bmlx
dWUgaWRlbnRpZmllciBmb3IgdGhlIGFkZHJlc3Mgc3BhY2UgdG8KZXN0YWJsaXNoIGEgY29tbXVu
aWNhdGlvbiBicmlkZ2UgYmV0d2VlbiB0aGUgVExCcyBvZiBkaWZmZXJlbnQgc3lzdGVtcy4KClRo
YXQgaXMgUEdELlBQTiAoZm9yIHZpcnR1YWxpemF0aW9uIHNjZW5hcmlvczogUzEvUzIuUEdELlBQ
TikKCmN1cnJlbnQ6CiBzZmVuY2Uudm1hICByczEgPSB2YWRkciwgcnMyID0gYXNpZAogaGZlbmNl
LnZ2bWEgcnMxID0gdmFkZHIsIHJzMiA9IGFzaWQKIGhmZW5jZS5ndm1hIHJzMSA9IGdhZGRyLCBy
czIgPSB2bWlkCgpwcm9wb3NlZDoKIHNmZW5jZS52bWEgIHJzMSA9IHZhZGRyLCByczIgPSBtb2Rl
OnBwbjphc2lkCiBoZmVuY2UudnZtYSByczEgPSB2YWRkciwgcnMyID0gbW9kZTpwcG46YXNpZAog
aGZlbmNlLmd2bWEgcnMxID0gZ2FkZHIsIHJzMiA9IG1vZGU6cHBuOnZtaWQKCiBtb2RlICAgICAg
LSBicm9hZGNhc3QgfCBsb2NhbAogcHBuICAgICAgIC0gdGhlIFBQTiBvZiB0aGUgYWRkcmVzcyBz
cGFjZSBvZiB0aGUgcm9vdCBwYWdlIHRhYmxlCiB2bWlkL2FzaWQgLSB0aGUgd2luZG93IGlkZW50
aWZpZXIgb2YgdGhlIGFkZHJlc3Mgc3BhY2UKCkF0IHRoZSBMaW51eCBQbHVtYmVyIENvbmZlcmVu
Y2UgMjAxOSBSSVNDVi1NQywgcmVmOlsxXSwgd2UndmUgc2hvd2VkIHR3bwpJT01NVSBleGFtcGxl
cyB0byBleHBsYWluIGhvdyBpdCB3b3JrIHdpdGggaGFyZHdhcmUuCgoxKSBJbiBhIGxpZ2h0d2Vp
Z2h0IElPTU1VIHN5c3RlbSAodXAgdG8gNjQgYWRkcmVzcyBzcGFjZXMpLCB0aGUgaGFyZHdhcmUK
ICAgY291bGQgZGlyZWN0bHkgY29udmVydCBQR0QuUFBOIGludG8gRElEIChJT01NVSBBU0lEKQoK
MikgRm9yIHRoZSBQQ0kgQVRTIHNjZW5hcmlvLCBpdHMgSU8gQVNJRC9WTUlEIGVuY29kaW5nIHNw
YWNlIGNhbiBzdXBwb3J0CiAgIGEgdmVyeSBsYXJnZSBudW1iZXIgb2YgYWRkcmVzcyBzcGFjZXMu
IFdlIHVzZSB0d28gcmV2ZXJzZSBtYXBwaW5nCiAgIHRhYmxlcyB0byBsZXQgdGhlIGhhcmR3YXJl
IHRyYW5zbGF0ZSBTMS9TMi5QR0QuUFBOIGludG8gSU8gQVNJRC9WTUlELgoKQVNZTkMgQlJPQURD
QVNUIFNGRU5DRS5WTUEKPT09PT09PT09PT09PT09PT09PT09PT09PT09CgpUbyBzdXBwb3J0IHRo
ZSBoaWdoIGxhdGVuY3kgYnJvYWRjYXN0IHNmZW5jZS52bWEgb3BlcmF0aW9uIGluIHRoZSBQQ0kg
QVRTCnVzYWdlIHNjZW5hcmlvLCB3ZSBtb2RpZnkgdGhlIHNmZW5jZS52bWEgZnJvbSBzeW5jaHJv
bm91cyBtb2RlIHRvCmFzeW5jaHJvbm91cyBtb2RlLiAoRm9yIHNpbXBsZXIgaW1wbGVtZW50YXRp
b24sIGlmIGhhcmR3YXJlIG9ubHkgaW1wbGVtZW50CnN5bmNocm9ub3VzIG1vZGUgYW5kIHNvZnR3
YXJlIHN0aWxsIHdvcmsgaW4gYXN5bmNocm9ub3VzIG1vZGUpCgpUbyBpbXBsZW1lbnQgdGhlIGFz
eW5jaHJvbm91cyBtb2RlLCAzIGZlYXR1cmVzIGFyZSBhZGRlZDoKwqAxKSBzc3RhdHVzOlRMQkkK
ICAgIEEgInN0YXR1cyBiaXQgLSBUTEJJIiBpcyBhZGRlZCB0byB0aGUgc3N0YXR1cyByZWdpc3Rl
ci4gVGhlIFRMQkkgc3RhdHVzCiAgICBiaXQgaW5kaWNhdGVzIGlmIHRoZXJlIGFyZSBzdGlsbCBv
dXRzdGFuZGluZyBzZmVuY2Uudm1hIHJlcXVlc3RzIG9uIHRoZQogICAgY3VycmVudCBoYXJ0Lgog
ICAgVmFsdWU6CiAgICAgIDE6IHNmZW5jZS52bWEgcmVxdWVzdHMgYXJlIG5vdCBjb21wbGV0ZWQu
CiAgICAgIDA6IGFsbCBzZmVjZS52bWEgcmVxdWVzdHMgY29tcGxldGVkLCByZXF1ZXN0IHF1ZXVl
IGlzIGVtcHR5LgoKIDIpIHNzdGF0dXM6VExCSUMKICAgIEEgImNvbnRyb2wgYml0cyAtIFRMQklD
IiBpcyBhZGRlZCB0byBzc3RhdHVzIHJlZ2lzdGVyLiBUaGUgVExCSUMgY29udHJvbAogICAgYml0
cyBhcmUgY29udHJvbGxlZCBieSBzb2Z0d2FyZS4KICAgICJXcml0ZSAxIiB3aWxsIHRyaWdnZXIg
dGhlIGN1cnJlbnQgaGFydCBjaGVjayB0byBzZWUgaWYgdGhlcmUgYXJlIHN0aWxsCiAgICBvdXRz
dGFuZGluZyBzZmVuY2Uudm1hIHJlcXVlc3RzLiBJZiB0aGVyZSBhcmUgdW5maW5pc2hlZCByZXF1
ZXN0cywgYW4KICAgIGludGVycnVwdCB3aWxsIGJlIGdlbmVyYXRlZCB3aGVuIHRoZSByZXF1ZXN0
IGlzIGNvbXBsZXRlZCwgbm90aWZ5aW5nIHRoZQogICAgc29mdHdhcmUgdGhhdCBhbGwgb2YgdGhl
IGN1cnJlbnQgc2ZlbmNlLnZtYSByZXF1ZXN0cyBoYXZlIGJlZW4gY29tcGxldGVkLgogICAgIldy
aXRlIDAiIHdpbGwgY2F1c2Ugbm90aGluZy4KCsKgMykgc3VwZXJ2aXNvciBpbnRlcnJ1cHQgcmVn
aXN0ZXIgKHNpcCAmIHNpZSk6VExCSSBmaW5pc2ggaW50ZXJydXB0CiAgICBBIHBlci1oYXJ0IGlu
dGVycnVwdCBpcyBhZGRlZCB0byBzdXBlcnZpc29yIGludGVycnVwdCByZWdpc3RlcnMuCiAgICBX
aGVuIGFsbCBzZmVuY2Uudm1hIHJlcXVlc3RzIGFyZSBjb21wbGV0ZWQgYW5kIHNzdGF0dXM6VExC
SUMgaGFzIGJlZW4KICAgIHRyaWdnZXJlZCwgaGFydCB3aWxsIHJlY2VpdmUgYSBUTEJJIGZpbmlz
aCBpbnRlcnJ1cHQuIEp1c3QgbGlrZSB0aW1lciwKICAgIHNvZnR3YXJlIGFuZCBleHRlcm5hbCBp
bnRlcnJ1cHQncyBkZWZpbml0aW9uIGluIHNpcCAmIHNpZS4KCkZha2UgY29kZToKCmZsdXNoX3Rs
Yl9wYWdlKHZtYSwgYWRkcikgewogICAgYXNpZCA9IGNwdV9hc2lkKHZtYS0+dm1fbW0pOwogICAg
cHBuID0gUEZOX0RPV04odm1hLT52bV9tbS0+cGdkKTsKCiAgICBzZmVuY2Uudm1hIChhZGRyLCAx
fFBQTl9PRkZTRVQocHBuKXxhc2lkKTsgLy8xLiBzdGFydCByZXF1ZXN0CgogICAgd2hpbGUoc3N0
YXR1czpUTEJJKSBpZiAodGltZV9vdXQoKSA+IDFtcykgYnJlYWs7IC8vMi4gbG9vcCBjaGVjawoK
ICAgIHdoaWxlIChzc3RhdHVzOlRMQkkpIHsKICAgICAgICAuLi4KICAgICAgICBzZXQgc3N0YXR1
czpUTEJJQzsKICAgICAgICB3YWl0X1RMQklfZmluaXNoX2ludGVycnVwdCgpOyAvLzMuIHdhaXQg
aXJxLCBpb19zY2hlZHVsZQogICAgfQp9CgpIZXJlIHdlIGdpdmUgMiBsZXZlbCBjaGVjazoKIDEp
IGxvb3AgY2hlY2sgc3N0YXR1czpUTEJJLCBDUFUgY291bGQgcmVzcG9uc2UgSW50ZXJydXB0Lgog
Mikgc2V0IHNzdGF0dXM6VExCSUMgYW5kIHdhaXQgZm9yIGlycSwgQ1BVIHNjaGVkdWxlIG91dCBm
b3Igb3RoZXIgdGFzay4KCkFDRS1EVk0gRXhhbXBsZQo9PT09PT09PT09PT09PT0KCkhvbmVzdGx5
LCAiYnJvYWRjYXN0aW5nIGFkZHIsIGFzaWQsIHZtaWQsIFMxL1MyLlBHRC5QUE4gdG8gaW50ZXJj
b25uZWN0cyIKYW5kICJBU1lOQyBTRkVOQ0UuVk1BIiBjb3VsZCBiZSBpbXBsZW1lbnRlZCBieSBB
Q0UtRFZNIHByb3RvY29sIHJlZiBbMl0uCgpUaGVyZSBhcmUgMyB0eXBlcyBvZiB0cmFuc2FjdGlv
bnMgaW4gRFZNOgoKwqAtIERWTSBvcGVyYXRpb24KICAgU2VuZCBhbGwgaW5mb3JtYXRpb24gdG8g
dGhlIGludGVyY29ubmVjdCwgaW5jbHVkaW5nIGFkZHIsIGFzaWQsCiAgIFMxLlBHRC5QUE4sIHZt
aWQsIFMyLlBHRC5QUE4uCgrCoC0gRFZNIHN5bmNocm9uaXphdGlvbgogICBDaGVjayB0aGF0IGFs
bCBEVk0gb3BlcmF0aW9ucyBoYXZlIGJlZW4gY29tcGxldGVkLiBJZiBub3QsIGl0IHdpbGwgdXNl
CiAgIHN0YXRlIG1hY2hpbmUgdG8gd2FpdCBEVk0gY29tcGxldGUgcmVxdWVzdHMuCgrCoC0gRFZN
IGNvbXBsZXRlCiAgIFJldHVybiB0cmFuc2FjdGlvbiBmcm9tIGNvbXBvbmVudHMsIGVnOiBJT01N
VS4gSWYgaGFydCBoYXMgcmVjZWl2ZWQgYWxsCiAgIERWTSBjb21wbGV0ZXMgd2hpY2ggYXJlIHRy
aWdnZXJlZCBieSBzZmVuY2Uudm1hIGluc3RydWN0aW9ucyBhbmQKICAgInNzdGF0dXM6VExCSUMi
IGhhcyBiZWVuIHNldCwgYSBUTEJJIGZpbmlzaCBpbnRlcnJ1cHQgaXMgdHJpZ2dlcmVkLgoKKEFj
dHVhbGx5LCB3ZSBkbyBub3QgbmVlZCB0byBpbXBsZW1lbnQgdGhlIGFib3ZlIGZ1bmN0aW9ucyBz
dHJpY3RseQogYWNjb3JkaW5nIHRvIHRoZSBBQ0Ugc3BlY2lmaWNhdGlvbiA6UCApCgogMTogaHR0
cHM6Ly93d3cubGludXhwbHVtYmVyc2NvbmYub3JnL2V2ZW50LzQvY29udHJpYnV0aW9ucy8zMDcv
CiAyOiBBTUJBIEFYSSBhbmQgQUNFIFByb3RvY29sIFNwZWNpZmljYXRpb24gLSBEaXN0cmlidXRl
ZCBWaXJ0dWFsIE1lbW9yeQogICAgVHJhbnNhY3Rpb25zIgoKU2lnbmVkLW9mZi1ieTogR3VvIFJl
biA8cmVuX2d1b0BjLXNreS5jb20+ClJldmlld2VkLWJ5OiBMaSBGZWl0ZW5nIDxmZWl0ZW5nX2xp
QGMtc2t5LmNvbT4KLS0tCiBzcmMvaHlwZXJ2aXNvci50ZXggfCAgNDMgKysrKysrKystLS0tLS0t
CiBzcmMvc3VwZXJ2aXNvci50ZXggfCAxNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTQzIGluc2VydGlvbnMo
KyksIDU1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NyYy9oeXBlcnZpc29yLnRleCBiL3Ny
Yy9oeXBlcnZpc29yLnRleAppbmRleCA0N2I5MGIyLi4zNzE4ODE5IDEwMDY0NAotLS0gYS9zcmMv
aHlwZXJ2aXNvci50ZXgKKysrIGIvc3JjL2h5cGVydmlzb3IudGV4CkBAIC0xMDk0LDE1ICsxMDk0
LDE1IEBAIFRoZSBoeXBlcnZpc29yIGV4dGVuc2lvbiBhZGRzIHR3byBuZXcgcHJpdmlsZWdlZCBm
ZW5jZSBpbnN0cnVjdGlvbnMuCiBcbXVsdGljb2x1bW57MX17Y3x9e29wY29kZX0gXFwKIFxobGlu
ZQogNyAmIDUgJiA1ICYgMyAmIDUgJiA3IFxcCi1IRkVOQ0UuR1ZNQSAmIHZtaWQgJiBnYWRkciAm
IFBSSVYgJiAwICYgU1lTVEVNIFxcCi1IRkVOQ0UuVlZNQSAmIGFzaWQgJiB2YWRkciAmIFBSSVYg
JiAwICYgU1lTVEVNIFxcCitIRkVOQ0UuR1ZNQSAmIG1vZGU6cHBuOnZtaWQgJiBnYWRkciAmIFBS
SVYgJiAwICYgU1lTVEVNIFxcCitIRkVOQ0UuVlZNQSAmIG1vZGU6cHBuOmFzaWQgJiB2YWRkciAm
IFBSSVYgJiAwICYgU1lTVEVNIFxcCiBcZW5ke3RhYnVsYXJ9CiBcZW5ke2NlbnRlcn0KIAogVGhl
IGh5cGVydmlzb3IgbWVtb3J5LW1hbmFnZW1lbnQgZmVuY2UgaW5zdHJ1Y3Rpb25zLCBIRkVOQ0Uu
R1ZNQSBhbmQKIEhGRU5DRS5WVk1BLCBhcmUgdmFsaWQgb25seSBpbiBIUy1tb2RlIHdoZW4ge1x0
dCBtc3RhdHVzfS5UVk09MCwgb3IgaW4gTS1tb2RlCiAoaXJyZXNwZWN0aXZlIG9mIHtcdHQgbXN0
YXR1c30uVFZNKS4KLVRoZXNlIGluc3RydWN0aW9ucyBwZXJmb3JtIGEgZnVuY3Rpb24gc2ltaWxh
ciB0byBTRkVOQ0UuVk1BCitUaGVzZSBpbnN0cnVjdGlvbnMgcGVyZm9ybSBhIGZ1bmN0aW9uIHNp
bWlsYXIgdG8gU0ZFTkNFLlZNQSAoYnJvYWRjYXN0L2xvY2FsKQogKFNlY3Rpb25+XHJlZntzZWM6
c2ZlbmNlLnZtYX0pLCBleGNlcHQgYXBwbHlpbmcgdG8gdGhlIGd1ZXN0LXBoeXNpY2FsCiBtZW1v
cnktbWFuYWdlbWVudCBkYXRhIHN0cnVjdHVyZXMgY29udHJvbGxlZCBieSBDU1Ige1x0dCBoZ2F0
cH0gKEhGRU5DRS5HVk1BKQogb3IgdGhlIFZTLWxldmVsIG1lbW9yeS1tYW5hZ2VtZW50IGRhdGEg
c3RydWN0dXJlcyBjb250cm9sbGVkIGJ5IENTUiB7XHR0IHZzYXRwfQpAQCAtMTEzNiwxMSArMTEz
NiwxMCBAQCBBbiBIRkVOQ0UuVlZNQSBpbnN0cnVjdGlvbiBhcHBsaWVzIG9ubHkgdG8gYSBzaW5n
bGUgdmlydHVhbCBtYWNoaW5lLCBpZGVudGlmaWVkCiBieSB0aGUgc2V0dGluZyBvZiB7XHR0IGhn
YXRwfS5WTUlEIHdoZW4gSEZFTkNFLlZWTUEgZXhlY3V0ZXMuCiBcZW5ke2NvbW1lbnRhcnl9CiAK
LVdoZW4ge1xlbSByczJ9JFxuZXEke1x0dCB4MH0sIGJpdHMgWExFTi0xOkFTSURNQVggb2YgdGhl
IHZhbHVlIGhlbGQgaW4ge1xlbQotcnMyfSBhcmUgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UgYW5k
IHNob3VsZCBiZSB6ZXJvZWQgYnkgc29mdHdhcmUgYW5kIGlnbm9yZWQKLWJ5IGN1cnJlbnQgaW1w
bGVtZW50YXRpb25zLgotRnVydGhlcm1vcmUsIGlmIEFTSURMRU5+JDwkfkFTSURNQVgsIHRoZSBp
bXBsZW1lbnRhdGlvbiBzaGFsbCBpZ25vcmUgYml0cwotQVNJRE1BWC0xOkFTSURMRU4gb2YgdGhl
IHZhbHVlIGhlbGQgaW4ge1xlbSByczJ9LgorV2hlbiB7XGVtIHJzMn0kXG5lcSR7XHR0IHgwfSwg
Yml0cyBjb250YWluIDMgaW5mb3JtYXRpb25zOiBtb2RlLCBwcG4sIGFzaWQuCisxKSBtb2RlIGNv
bnRyb2wgSEZFTkNFLlZWTUEgYnJvYWRjYXN0IG9yIG5vdC4KKzIpIHBwbiBpcyB0aGUgcm9vdCBw
YWdlIHRhbGJlJ3MgUFBOIG9mIHRoZSBhc2lkIGFkZHJlc3Mgc3BhY2UuCiszKSBhc2lkIGlzIHRo
ZSBpZGVudGlmaWVyIG9mIHByb2Nlc3MgaW4gdmlydHVhbCBtYWNoaW5lLgogCiBcYmVnaW57Y29t
bWVudGFyeX0KIFNpbXBsZXIgaW1wbGVtZW50YXRpb25zIG9mIEhGRU5DRS5WVk1BIGNhbiBpZ25v
cmUgdGhlIGd1ZXN0IHZpcnR1YWwgYWRkcmVzcyBpbgpAQCAtMTE2OCwxMSArMTE2NywxMCBAQCBw
aHlzaWNhbCBhZGRyZXNzZXMgaW4gUE1QIGFkZHJlc3MgcmVnaXN0ZXJzIChTZWN0aW9uflxyZWZ7
c2VjOnBtcH0pIGFuZCBpbiBwYWdlCiB0YWJsZSBlbnRyaWVzIChTZWN0aW9ucyBccmVme3NlYzpz
djMyfSwgXHJlZntzZWM6c3YzOX0sIGFuZH5ccmVme3NlYzpzdjQ4fSkuCiBcZW5ke2NvbW1lbnRh
cnl9CiAKLVdoZW4ge1xlbSByczJ9JFxuZXEke1x0dCB4MH0sIGJpdHMgWExFTi0xOlZNSURNQVgg
b2YgdGhlIHZhbHVlIGhlbGQgaW4ge1xlbQotcnMyfSBhcmUgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1
c2UgYW5kIHNob3VsZCBiZSB6ZXJvZWQgYnkgc29mdHdhcmUgYW5kIGlnbm9yZWQKLWJ5IGN1cnJl
bnQgaW1wbGVtZW50YXRpb25zLgotRnVydGhlcm1vcmUsIGlmIFZNSURMRU5+JDwkflZNSURNQVgs
IHRoZSBpbXBsZW1lbnRhdGlvbiBzaGFsbCBpZ25vcmUgYml0cwotVk1JRE1BWC0xOlZNSURMRU4g
b2YgdGhlIHZhbHVlIGhlbGQgaW4ge1xlbSByczJ9LgorV2hlbiB7XGVtIHJzMn0kXG5lcSR7XHR0
IHgwfSwgYml0cyBjb250YWluIDMgaW5mb3JtYXRpb25zOiBtb2RlLCB2bWlkLCBwcG4uCisxKSBt
b2RlIGNvbnRyb2wgSEZFTkNFLkdWTUEgYnJvYWRjYXN0IG9yIG5vdC4KKzIpIHBwbiBpcyB0aGUg
cm9vdCBwYWdlIHRhbGJlJ3MgUFBOIG9mIHRoZSB2bWlkIGFkZHJlc3Mgc3BhY2UuCiszKSB2bWlk
IGlzIHRoZSBpZGVudGlmaWVyIG9mIHZpcnR1YWwgbWFjaGluZS4KIAogXGJlZ2lue2NvbW1lbnRh
cnl9CiBTaW1wbGVyIGltcGxlbWVudGF0aW9ucyBvZiBIRkVOQ0UuR1ZNQSBjYW4gaWdub3JlIHRo
ZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIGluCkBAIC0xNTY3LDIxICsxNTY1LDIyIEBAIHJlZ2lz
dGVyLgogXHN1YnNlY3Rpb257TWVtb3J5LU1hbmFnZW1lbnQgRmVuY2VzfQogCiBUaGUgYmVoYXZp
b3Igb2YgdGhlIFNGRU5DRS5WTUEgaW5zdHJ1Y3Rpb24gaXMgYWZmZWN0ZWQgYnkgdGhlIGN1cnJl
bnQKLXZpcnR1YWxpemF0aW9uIG1vZGUgVi4gIFdoZW4gVj0wLCB0aGUgdmlydHVhbC1hZGRyZXNz
IGFyZ3VtZW50IGlzIGFuIEhTLWxldmVsCi12aXJ0dWFsIGFkZHJlc3MsIGFuZCB0aGUgQVNJRCBh
cmd1bWVudCBpcyBhbiBIUy1sZXZlbCBBU0lELgordmlydHVhbGl6YXRpb24gbW9kZSBWLiAgV2hl
biBWPTAsIHRoZSByczEgYXJndW1lbnQgaXMgYW4gSFMtbGV2ZWwKK3ZpcnR1YWwgYWRkcmVzcywg
YW5kIHRoZSByczIgYXJndW1lbnQgaXMgYW4gSFMtbGV2ZWwgQVNJRCBhbmQgcm9vdCBwYWdlIHRh
YmxlJ3MgUFBOLgogVGhlIGluc3RydWN0aW9uIG9yZGVycyBzdG9yZXMgb25seSB0byBIUy1sZXZl
bCBhZGRyZXNzLXRyYW5zbGF0aW9uIHN0cnVjdHVyZXMKIHdpdGggc3Vic2VxdWVudCBIUy1sZXZl
bCBhZGRyZXNzIHRyYW5zbGF0aW9ucy4KIAotV2hlbiBWPTEsIHRoZSB2aXJ0dWFsLWFkZHJlc3Mg
YXJndW1lbnQgdG8gU0ZFTkNFLlZNQSBpcyBhIGd1ZXN0IHZpcnR1YWwKLWFkZHJlc3Mgd2l0aGlu
IHRoZSBjdXJyZW50IHZpcnR1YWwgbWFjaGluZSwgYW5kIHRoZSBBU0lEIGFyZ3VtZW50IGlzIGEg
VlMtbGV2ZWwKLUFTSUQgd2l0aGluIHRoZSBjdXJyZW50IHZpcnR1YWwgbWFjaGluZS4KK1doZW4g
Vj0xLCB0aGUgcnMxIGFyZ3VtZW50IHRvIFNGRU5DRS5WTUEgaXMgYSBndWVzdCB2aXJ0dWFsCith
ZGRyZXNzIHdpdGhpbiB0aGUgY3VycmVudCB2aXJ0dWFsIG1hY2hpbmUsIGFuZCB0aGUgcnMyIGFy
Z3VtZW50IGlzIGEgVlMtbGV2ZWwKK0FTSUQgYW5kIHJvb3QgcGFnZSB0YWJsZSdzIFBQTiB3aXRo
aW4gdGhlIGN1cnJlbnQgdmlydHVhbCBtYWNoaW5lLgogVGhlIGN1cnJlbnQgdmlydHVhbCBtYWNo
aW5lIGlzIGlkZW50aWZpZWQgYnkgdGhlIFZNSUQgZmllbGQgb2YgQ1NSIHtcdHQgaGdhdHB9LAot
YW5kIHRoZSBlZmZlY3RpdmUgQVNJRCBjYW4gYmUgY29uc2lkZXJlZCB0byBiZSB0aGUgY29tYmlu
YXRpb24gb2YgdGhpcyBWTUlECi13aXRoIHRoZSBWUy1sZXZlbCBBU0lELgorYW5kIHRoZSBlZmZl
Y3RpdmUgQVNJRCBhbmQgcm9vdCBwYWdlIHRhYmxlJ3MgUFBOIGNhbiBiZSBjb25zaWRlcmVkIHRv
IGJlIHRoZQorY29tYmluYXRpb24gb2YgdGhpcyBWTUlEIGFuZCByb290IHBhZ2UgdGFibGUncyBQ
UE4gd2l0aCB0aGUgVlMtbGV2ZWwgQVNJRCBhbmQKK3Jvb3QgcGFnZSB0YWJsZSdzIFBQTi4KIFRo
ZSBTRkVOQ0UuVk1BIGluc3RydWN0aW9uIG9yZGVycyBzdG9yZXMgb25seSB0byB0aGUgVlMtbGV2
ZWwKIGFkZHJlc3MtdHJhbnNsYXRpb24gc3RydWN0dXJlcyB3aXRoIHN1YnNlcXVlbnQgVlMtbGV2
ZWwgYWRkcmVzcyB0cmFuc2xhdGlvbnMKLWZvciB0aGUgc2FtZSB2aXJ0dWFsIG1hY2hpbmUsIGku
ZS4sIG9ubHkgd2hlbiB7XHR0IGhnYXRwfS5WTUlEIGlzIHRoZSBzYW1lIGFzCi13aGVuIHRoZSBT
RkVOQ0UuVk1BIGV4ZWN1dGVkLgorZm9yIHRoZSBzYW1lIHZpcnR1YWwgbWFjaGluZSwgaS5lLiwg
b25seSB3aGVuIHtcdHQgaGdhdHB9LlZNSUQgYW5kIHtcXHR0IGhnYXRwfS5QUE4gaXMKK3RoZSBz
YW1lIGFzIHdoZW4gdGhlIFNGRU5DRS5WTUEgZXhlY3V0ZWQuCiAKIEh5cGVydmlzb3IgaW5zdHJ1
Y3Rpb25zIEhGRU5DRS5HVk1BIGFuZCBIRkVOQ0UuVlZNQSBwcm92aWRlIGFkZGl0aW9uYWwKIG1l
bW9yeS1tYW5hZ2VtZW50IGZlbmNlcyB0byBjb21wbGVtZW50IFNGRU5DRS5WTUEuCmRpZmYgLS1n
aXQgYS9zcmMvc3VwZXJ2aXNvci50ZXggYi9zcmMvc3VwZXJ2aXNvci50ZXgKaW5kZXggYmEzY2Vk
NS4uMjg3N2I3YSAxMDA2NDQKLS0tIGEvc3JjL3N1cGVydmlzb3IudGV4CisrKyBiL3NyYy9zdXBl
cnZpc29yLnRleApAQCAtNDcsMTAgKzQ3LDEyIEBAIHJlZ2lzdGVyIGtlZXBzIHRyYWNrIG9mIHRo
ZSBwcm9jZXNzb3IncyBjdXJyZW50IG9wZXJhdGluZyBzdGF0ZS4KIFxiZWdpbntjZW50ZXJ9CiBc
c2V0bGVuZ3Roe1x0YWJjb2xzZXB9ezRwdH0KIFxzY2FsZWJveHswLjk1fXsKLVxiZWdpbnt0YWJ1
bGFyfXtjV2NjY2NjV2NjY2NXY2N9CitcYmVnaW57dGFidWxhcn17Y2NjV2NjY2NjV2NjY2NXY2N9
CiBcXAogXGluc3RiaXR7MzF9ICYKLVxpbnN0Yml0cmFuZ2V7MzB9ezIwfSAmCitcaW5zdGJpdHsz
MH0gJgorXGluc3RiaXR7Mjl9ICYKK1xpbnN0Yml0cmFuZ2V7Mjh9ezIwfSAmCiBcaW5zdGJpdHsx
OX0gJgogXGluc3RiaXR7MTh9ICYKIFxpbnN0Yml0ezE3fSAmCkBAIC02Niw2ICs2OCw4IEBAIHJl
Z2lzdGVyIGtlZXBzIHRyYWNrIG9mIHRoZSBwcm9jZXNzb3IncyBjdXJyZW50IG9wZXJhdGluZyBz
dGF0ZS4KIFxpbnN0Yml0ezB9IFxcCiBcaGxpbmUKIFxtdWx0aWNvbHVtbnsxfXt8Y3x9e1NEfSAm
CitcbXVsdGljb2x1bW57MX17fGN8fXtUTEJJfSAmCitcbXVsdGljb2x1bW57MX17fGN8fXtUTEJJ
Q30gJgogXG11bHRpY29sdW1uezF9e2N8fXtcd3ByaX0gJgogXG11bHRpY29sdW1uezF9e2N8fXtN
WFJ9ICYKIFxtdWx0aWNvbHVtbnsxfXtjfH17U1VNfSAmCkBAIC04Miw3ICs4Niw3IEBAIHJlZ2lz
dGVyIGtlZXBzIHRyYWNrIG9mIHRoZSBwcm9jZXNzb3IncyBjdXJyZW50IG9wZXJhdGluZyBzdGF0
ZS4KIFxtdWx0aWNvbHVtbnsxfXtjfH17XHdwcml9CiBcXAogXGhsaW5lCi0xICYgMTEgJiAxICYg
MSAmIDEgJiAyICYgMiAmIDQgJiAxICYgMSAmIDEgJiAxICYgMyAmIDEgJiAxIFxcCisxICYgMSAm
IDEgJiAxMCAmIDEgJiAxICYgMSAmIDIgJiAyICYgNCAmIDEgJiAxICYgMSAmIDEgJiAzICYgMSAm
IDEgXFwKIFxlbmR7dGFidWxhcn19CiBcZW5ke2NlbnRlcn0KIH0KQEAgLTk1LDEwICs5OSwxMiBA
QCByZWdpc3RlciBrZWVwcyB0cmFjayBvZiB0aGUgcHJvY2Vzc29yJ3MgY3VycmVudCBvcGVyYXRp
bmcgc3RhdGUuCiB7XGZvb3Rub3Rlc2l6ZQogXGJlZ2lue2NlbnRlcn0KIFxzZXRsZW5ndGh7XHRh
YmNvbHNlcH17NHB0fQotXGJlZ2lue3RhYnVsYXJ9e2NNRlNjY2NjfQorXGJlZ2lue3RhYnVsYXJ9
e2NjY01GU2NjY2N9CiBcXAogXGluc3RiaXR7U1hMRU4tMX0gJgotXGluc3RiaXRyYW5nZXtTWExF
Ti0yfXszNH0gJgorXGluc3RiaXR7U1hMRU4tMn0gJgorXGluc3RiaXR7U1hMRU4tM30gJgorXGlu
c3RiaXRyYW5nZXtTWExFTi00fXszNH0gJgogXGluc3RiaXRyYW5nZXszM317MzJ9ICYKIFxpbnN0
Yml0cmFuZ2V7MzF9ezIwfSAmCiBcaW5zdGJpdHsxOX0gJgpAQCAtMTA3LDYgKzExMyw4IEBAIHJl
Z2lzdGVyIGtlZXBzIHRyYWNrIG9mIHRoZSBwcm9jZXNzb3IncyBjdXJyZW50IG9wZXJhdGluZyBz
dGF0ZS4KICBcXAogXGhsaW5lCiBcbXVsdGljb2x1bW57MX17fGN8fXtTRH0gJgorXG11bHRpY29s
dW1uezF9e3xjfH17VExCSX0gJgorXG11bHRpY29sdW1uezF9e3xjfH17VExCSUN9ICYKIFxtdWx0
aWNvbHVtbnsxfXtjfH17XHdwcml9ICYKIFxtdWx0aWNvbHVtbnsxfXtjfH17VVhMWzE6MF19ICYK
IFxtdWx0aWNvbHVtbnsxfXtjfH17XHdwcml9ICYKQEAgLTExNSw3ICsxMjMsNyBAQCByZWdpc3Rl
ciBrZWVwcyB0cmFjayBvZiB0aGUgcHJvY2Vzc29yJ3MgY3VycmVudCBvcGVyYXRpbmcgc3RhdGUu
CiBcbXVsdGljb2x1bW57MX17Y3x9e1x3cHJpfSAmCiAgXFwKIFxobGluZQotMSAmIFNYTEVOLTM1
ICYgMiAmIDEyICYgMSAmIDEgJiAxICYgXFwKKzEgJiAxICYgMSAmIFNYTEVOLTM3ICYgMiAmIDEy
ICYgMSAmIDEgJiAxICYgXFwKIFxlbmR7dGFidWxhcn0KIFxiZWdpbnt0YWJ1bGFyfXtjV1dGY2Nj
Y1djY30KIFxcCkBAIC0xNTIsNiArMTYwLDE3IEBAIHJlZ2lzdGVyIGtlZXBzIHRyYWNrIG9mIHRo
ZSBwcm9jZXNzb3IncyBjdXJyZW50IG9wZXJhdGluZyBzdGF0ZS4KIFxsYWJlbHtzc3RhdHVzcmVn
fQogXGVuZHtmaWd1cmUqfQogCitUaGUgVExCSSAocmVhZC1vbmx5KSBiaXQgaW5kaWNhdGVzIHRo
YXQgYW55IGFzeW5jIHNmZW5jZS52bWEgb3BlcmF0aW9ucyBhcmUKK3N0aWxsIHBlbmRlZCBvbiB0
aGUgaGFydC4gVGhlIHZhbHVlOjAgbWVhbnMgdGhhdCB0aGVyZSBpcyBubyBzZmVuY2Uudm1hCitv
cGVyYXRpb25zIHBlbmRpbmcgYW5kIHZhbHVlOjEgbWVhbnMgdGhhdCB0aGVyZSBhcmUgc3RpbGwg
c2ZlbmNlLnZtYSBvcGVyYXRpb25zCitwZW5kaW5nIG9uIHRoZSBoYXJ0LgorCitXaGVuIHRoZSBz
c3RhdHVzOlRMQklDIGJpdCBpcyB3cml0dGVuIDEsIGl0IHRyaWdnZXJzIHRoZSBoYXJkd2FyZSB0
byBjaGVjayBpZgordGhlcmUgYXJlIGFueSBUTEIgaW52YWxpZGF0ZSBvcGVyYXRpb25zIGJlaW5n
IHBlbmRlZC4gV2hlbiBhbGwgb3BlcmF0aW9ucyBhcmUKK2ZpbmlzaGVkLCBhIFRMQiBJbnZhbGlk
YXRlIGZpbmlzaCBpbnRlcnJ1cHQgd2lsbCBiZSB0cmlnZ2VyZWQKKyhzZWUgU2VjdGlvbn5ccmVm
e3NpcHJlZ30pLiBXaGVuIHRoZSBzc3RhdHVzOlRMQklDIGJpdCBpcyB3cml0dGVuIDAsIGl0IHdp
bGwKK2NhdXNlIG5vdGhpbmcuIFJlYWRpbmcgc3N0YXR1czpUTEJJQyBiaXQgd2lsbCBhbGF3YXlz
IHJldHVybiAwLgorCiBUaGUgU1BQIGJpdCBpbmRpY2F0ZXMgdGhlIHByaXZpbGVnZSBsZXZlbCBh
dCB3aGljaCBhIGhhcnQgd2FzIGV4ZWN1dGluZyBiZWZvcmUKIGVudGVyaW5nIHN1cGVydmlzb3Ig
bW9kZS4gIFdoZW4gYSB0cmFwIGlzIHRha2VuLCBTUFAgaXMgc2V0IHRvIDAgaWYgdGhlIHRyYXAK
IG9yaWdpbmF0ZWQgZnJvbSB1c2VyIG1vZGUsIG9yIDEgb3RoZXJ3aXNlLiAgV2hlbiBhbiBTUkVU
IGluc3RydWN0aW9uCkBAIC0zMjksOCArMzQ4LDEwIEBAIFNYTEVOLWJpdCByZWFkL3dyaXRlIHJl
Z2lzdGVyIGNvbnRhaW5pbmcgaW50ZXJydXB0IGVuYWJsZSBiaXRzLgoge1xmb290bm90ZXNpemUK
IFxiZWdpbntjZW50ZXJ9CiBcc2V0bGVuZ3Roe1x0YWJjb2xzZXB9ezRwdH0KLVxiZWdpbnt0YWJ1
bGFyfXtLY0ZjRmNjfQotXGluc3RiaXRyYW5nZXtTWExFTi0xfXsxMH0gJgorXGJlZ2lue3RhYnVs
YXJ9e0tjRmNGY0ZjY30KK1xpbnN0Yml0cmFuZ2V7U1hMRU4tMX17MTR9ICYKK1xpbnN0Yml0ezEz
fSAmCitcaW5zdGJpdHJhbmdlezEyfXsxMH0gJgogXGluc3RiaXR7OX0gJgogXGluc3RiaXRyYW5n
ZXs4fXs2fSAmCiBcaW5zdGJpdHs1fSAmCkBAIC0zMzksNiArMzYwLDggQEAgU1hMRU4tYml0IHJl
YWQvd3JpdGUgcmVnaXN0ZXIgY29udGFpbmluZyBpbnRlcnJ1cHQgZW5hYmxlIGJpdHMuCiBcaW5z
dGJpdHswfSBcXAogXGhsaW5lCiBcbXVsdGljb2x1bW57MX17fGN8fXtcd3ByaX0gJgorXG11bHRp
Y29sdW1uezF9e2N8fXtTVExCSVB9ICYKK1xtdWx0aWNvbHVtbnsxfXt8Y3x9e1x3cHJpfSAmCiBc
bXVsdGljb2x1bW57MX17Y3x9e1NFSVB9ICYKIFxtdWx0aWNvbHVtbnsxfXtjfH17XHdwcml9ICYK
IFxtdWx0aWNvbHVtbnsxfXtjfH17U1RJUH0gJgpAQCAtMzQ2LDcgKzM2OSw3IEBAIFNYTEVOLWJp
dCByZWFkL3dyaXRlIHJlZ2lzdGVyIGNvbnRhaW5pbmcgaW50ZXJydXB0IGVuYWJsZSBiaXRzLgog
XG11bHRpY29sdW1uezF9e2N8fXtTU0lQfSAmCiBcbXVsdGljb2x1bW57MX17Y3x9e1x3cHJpfSBc
XAogXGhsaW5lCi1TWExFTi0xMCAmIDEgJiAzICYgMSAmIDMgJiAxICYgMSBcXAorU1hMRU4tMTQg
JiAxICYgMyAmIDEgJiAzICYgMSAmIDMgJiAxICYgMSBcXAogXGVuZHt0YWJ1bGFyfQogXGVuZHtj
ZW50ZXJ9CiB9CkBAIC0zNTksOCArMzgyLDEwIEBAIFNYTEVOLTEwICYgMSAmIDMgJiAxICYgMyAm
IDEgJiAxIFxcCiB7XGZvb3Rub3Rlc2l6ZQogXGJlZ2lue2NlbnRlcn0KIFxzZXRsZW5ndGh7XHRh
YmNvbHNlcH17NHB0fQotXGJlZ2lue3RhYnVsYXJ9e0tjRmNGY2N9Ci1caW5zdGJpdHJhbmdle1NY
TEVOLTF9ezEwfSAmCitcYmVnaW57dGFidWxhcn17S2NGY0ZjRmNjfQorXGluc3RiaXRyYW5nZXtT
WExFTi0xfXsxNH0gJgorXGluc3RiaXR7MTN9ICYKK1xpbnN0Yml0cmFuZ2V7MTJ9ezEwfSAmCiBc
aW5zdGJpdHs5fSAmCiBcaW5zdGJpdHJhbmdlezh9ezZ9ICYKIFxpbnN0Yml0ezV9ICYKQEAgLTM2
OSw2ICszOTQsOCBAQCBTWExFTi0xMCAmIDEgJiAzICYgMSAmIDMgJiAxICYgMSBcXAogXGluc3Ri
aXR7MH0gXFwKIFxobGluZQogXG11bHRpY29sdW1uezF9e3xjfH17XHdwcml9ICYKK1xtdWx0aWNv
bHVtbnsxfXtjfH17U1RMQklFfSAmCitcbXVsdGljb2x1bW57MX17fGN8fXtcd3ByaX0gJgogXG11
bHRpY29sdW1uezF9e2N8fXtTRUlFfSAmCiBcbXVsdGljb2x1bW57MX17Y3x9e1x3cHJpfSAmCiBc
bXVsdGljb2x1bW57MX17Y3x9e1NUSUV9ICYKQEAgLTM3Niw3ICs0MDMsNyBAQCBTWExFTi0xMCAm
IDEgJiAzICYgMSAmIDMgJiAxICYgMSBcXAogXG11bHRpY29sdW1uezF9e2N8fXtTU0lFfSAmCiBc
bXVsdGljb2x1bW57MX17Y3x9e1x3cHJpfSBcXAogXGhsaW5lCi1TWExFTi0xMCAmIDEgJiAzICYg
MSAmIDMgJiAxICYgMSBcXAorU1hMRU4tMTQgJiAxICYgMyAmIDEgJiAzICYgMSAmIDMgJiAxICYg
MSBcXAogXGVuZHt0YWJ1bGFyfQogXGVuZHtjZW50ZXJ9CiB9CkBAIC00MTAsNiArNDM3LDEyIEBA
IHdoZW4gdGhlIFNFSUUgYml0IGluIHRoZSB7XHR0IHNpZX0gcmVnaXN0ZXIgaXMgY2xlYXIuICBU
aGUgaW1wbGVtZW50YXRpb24KIHNob3VsZCBwcm92aWRlIGZhY2lsaXRpZXMgdG8gbWFzaywgdW5t
YXNrLCBhbmQgcXVlcnkgdGhlIGNhdXNlIG9mIGV4dGVybmFsCiBpbnRlcnJ1cHRzLgogCitBIHN1
cGVydmlzb3ItbGV2ZWwgVExCIEludmFsaWRhdGUgZmluaXNoIGludGVycnVwdCBpcyBwZW5kaW5n
IGlmIHRoZSBTVExCSVAgYml0CitpbiB0aGUge1x0dCBzaXB9IHJlZ2lzdGVyIGlzIHNldC4gIFN1
cGVydmlzb3ItbGV2ZWwgVExCIEludmFsaWRhdGUgZmluaXNoCitpbnRlcnJ1cHRzIGFyZSBkaXNh
YmxlZCB3aGVuIHRoZSBTVExCSUUgYml0IGluIHRoZSB7XHR0IHNpZX0gcmVnaXN0ZXIgaXMgY2xl
YXIuCitXaGVuIGhhcnQgdGxiIGludmFsaWRhdGUgb3BlcmF0aW9ucyBhcmUgZmluaXNoZWQsIGhh
cmR3YXJlIHdpbGwgY2hhbmdlIHNzdGF0dXM6VExCSQorYml0IGZyb20gMSB0byAwIGFuZCB0cmln
Z2VyIFRMQiBJbnZhbGlkYXRlIGZpbmlzaCBpbnRlcnJ1cHQuCisKIFxiZWdpbntjb21tZW50YXJ5
fQogVGhlIHtcdHQgc2lwfSBhbmQge1x0dCBzaWV9IHJlZ2lzdGVycyBhcmUgc3Vic2V0cyBvZiB0
aGUge1x0dCBtaXB9IGFuZCB7XHR0CiBtaWV9IHJlZ2lzdGVycy4gIFJlYWRpbmcgYW55IGZpZWxk
LCBvciB3cml0aW5nIGFueSB3cml0YWJsZSBmaWVsZCwgb2Yge1x0dApAQCAtNTk4LDcgKzYzMSw5
IEBAIHNvIGlzIG9ubHkgZ3VhcmFudGVlZCB0byBob2xkIHN1cHBvcnRlZCBleGNlcHRpb24gY29k
ZXMuCiAgIDEgICAgICAgICAmIDUgICAgICAgICAgICAgICAmIFN1cGVydmlzb3IgdGltZXIgaW50
ZXJydXB0IFxcCiAgIDEgICAgICAgICAmIDYtLTggICAgICAgICAgICAmIHtcZW0gUmVzZXJ2ZWR9
IFxcCiAgIDEgICAgICAgICAmIDkgICAgICAgICAgICAgICAmIFN1cGVydmlzb3IgZXh0ZXJuYWwg
aW50ZXJydXB0IFxcCi0gIDEgICAgICAgICAmIDEwLS0xNSAgICAgICAgICAmIHtcZW0gUmVzZXJ2
ZWR9IFxcCisgIDEgICAgICAgICAmIDEwLS0xMSAgICAgICAgICAmIHtcZW0gUmVzZXJ2ZWR9IFxc
CisgIDEgICAgICAgICAmIDEyICAgICAgICAgICAgICAmIFN1cGVydmlzb3IgVExCSSBmaW5pc2gg
aW50ZXJydXB0IFxcCisgIDEgICAgICAgICAmIDEzLS0xNSAgICAgICAgICAmIHtcZW0gUmVzZXJ2
ZWR9IFxcCiAgIDEgICAgICAgICAmICRcZ2UkMTYgICAgICAgICAmIHtcZW0gQXZhaWxhYmxlIGZv
ciBwbGF0Zm9ybSB1c2V9IFxcIFxobGluZQogICAwICAgICAgICAgJiAwICAgICAgICAgICAgICAg
JiBJbnN0cnVjdGlvbiBhZGRyZXNzIG1pc2FsaWduZWQgXFwKICAgMCAgICAgICAgICYgMSAgICAg
ICAgICAgICAgICYgSW5zdHJ1Y3Rpb24gYWNjZXNzIGZhdWx0IFxcCkBAIC04ODQsNyArOTE5LDcg
QEAgcHJvdmlkZWQuCiBcbXVsdGljb2x1bW57MX17Y3x9e29wY29kZX0gXFwKIFxobGluZQogNyAm
IDUgJiA1ICYgMyAmIDUgJiA3IFxcCi1TRkVOQ0UuVk1BICYgYXNpZCAmIHZhZGRyICYgUFJJViAm
IDAgJiBTWVNURU0gXFwKK1NGRU5DRS5WTUEgJiBtb2RlOnBwbjphc2lkICYgdmFkZHIgJiBMT0NB
TCAmIDAgJiBTWVNURU0gXFwKIFxlbmR7dGFidWxhcn0KIFxlbmR7Y2VudGVyfQogCkBAIC04OTks
MjEgKzkzNCw3MCBAQCBmcm9tIHRoYXQgaGFydCB0byB0aGUgbWVtb3J5LW1hbmFnZW1lbnQgZGF0
YSBzdHJ1Y3R1cmVzLgogRnVydGhlciBkZXRhaWxzIG9uIHRoZSBiZWhhdmlvciBvZiB0aGlzIGlu
c3RydWN0aW9uIGFyZQogZGVzY3JpYmVkIGluIFNlY3Rpb25+XHJlZnt2aXJ0LWNvbnRyb2x9IGFu
ZCBTZWN0aW9uflxyZWZ7cG1wLXZtZW19LgogCitTRkVOQ0UuVk1BIGlzIGRlZmluZWQgYXMgYW4g
YXN5bmNocm9ub3VzIGNvbXBsZXRpb24gaW5zdHJ1Y3Rpb24sIHdoaWNoIG1lYW5zCit0aGF0IHRo
ZSBUTEIgb3BlcmF0aW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGNvbXBsZXRlIHdoZW4gdGhlIGlu
c3RydWN0aW9uIHJldGlyZXMuCitTb2Z0d2FyZSBuZWVkIGNoZWNrIHNzdGF0dXM6VExCSSB0byBk
ZXRlcm1pbmUgYWxsIFRMQiBvcGVyYXRpb25zIGNvbXBsZXRlLgorVGhlIHNzdGF0dXM6VExCSSBk
ZXNjcmliZWQgaW4gU2VjdGlvbn5ccmVme3NzdGF0dXN9LiBXaGVuIGhhcmR3YXJlIGNoYW5nZQor
c3N0YXR1czpUTEJJIGJpdCBmcm9tIDEgdG8gMCwgdGhlIFRMQiBJbnZhbGlkYXRlIGZpbmlzaCBp
bnRlcnJ1cHQgd2lsbCBiZQordHJpZ2dlcmVkLgorCiBcYmVnaW57Y29tbWVudGFyeX0KLVRoZSBT
RkVOQ0UuVk1BIGlzIHVzZWQgdG8gZmx1c2ggYW55IGxvY2FsIGhhcmR3YXJlIGNhY2hlcyByZWxh
dGVkIHRvCitUaGUgU0ZFTkNFLlZNQSBpcyB1c2VkIHRvIGZsdXNoIGFueSBsb2NhbC9yZW1vdGUg
aGFyZHdhcmUgY2FjaGVzIHJlbGF0ZWQgdG8KIGFkZHJlc3MgdHJhbnNsYXRpb24uICBJdCBpcyBz
cGVjaWZpZWQgYXMgYSBmZW5jZSByYXRoZXIgdGhhbiBhIFRMQgogZmx1c2ggdG8gcHJvdmlkZSBj
bGVhbmVyIHNlbWFudGljcyB3aXRoIHJlc3BlY3QgdG8gd2hpY2ggaW5zdHJ1Y3Rpb25zCiBhcmUg
YWZmZWN0ZWQgYnkgdGhlIGZsdXNoIG9wZXJhdGlvbiBhbmQgdG8gc3VwcG9ydCBhIHdpZGVyIHZh
cmlldHkgb2YKIGR5bmFtaWMgY2FjaGluZyBzdHJ1Y3R1cmVzIGFuZCBtZW1vcnktbWFuYWdlbWVu
dCBzY2hlbWVzLiAgU0ZFTkNFLlZNQQogaXMgYWxzbyB1c2VkIGJ5IGhpZ2hlciBwcml2aWxlZ2Ug
bGV2ZWxzIHRvIHN5bmNocm9uaXplIHBhZ2UgdGFibGUKLXdyaXRlcyBhbmQgdGhlIGFkZHJlc3Mg
dHJhbnNsYXRpb24gaGFyZHdhcmUuCit3cml0ZXMgYW5kIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9u
IGhhcmR3YXJlLiBUaGVyZSBpcyBhIG1vZGUgYml0IHRvIGRldGVybWluZQorc2ZlbmNlLnZtYSB3
b3VsZCBicm9hZGNhc3Qgb24gaW50ZXJjb25uZWN0IG9yIG5vdC4KIFxlbmR7Y29tbWVudGFyeX0K
IAotU0ZFTkNFLlZNQSBvcmRlcnMgb25seSB0aGUgbG9jYWwgaGFydCdzIGltcGxpY2l0IHJlZmVy
ZW5jZXMgdG8gdGhlCi1tZW1vcnktbWFuYWdlbWVudCBkYXRhIHN0cnVjdHVyZXMuCitcYmVnaW57
ZmlndXJlfVtoIV0KK3tcZm9vdG5vdGVzaXplCitcYmVnaW57Y2VudGVyfQorXGJlZ2lue3RhYnVs
YXJ9e2NAe31FQHt9S30KK1xpbnN0Yml0ezMxfSAmCitcaW5zdGJpdHJhbmdlezMwfXs5fSAmCitc
aW5zdGJpdHJhbmdlezh9ezB9IFxcCitcaGxpbmUKK1xtdWx0aWNvbHVtbnsxfXt8Y3x9e3tcdHQg
TU9ERX19ICYKK1xtdWx0aWNvbHVtbnsxfXt8Y3x9e3tcdHQgUFBOIChyb290IHBhZ2UgdGFibGUp
fX0gJgorXG11bHRpY29sdW1uezF9e3xjfH17e1x0dCBBU0lEfX0gXFwKK1xobGluZQorMSAmIDIy
ICYgOSBcXAorXGVuZHt0YWJ1bGFyfQorXGVuZHtjZW50ZXJ9Cit9CitcdnNwYWNley0wLjFpbn0K
K1xjYXB0aW9ue1JWMzIgc2ZlbmNlLnZtYSByczIgZm9ybWF0Ln0KK1xsYWJlbHtydjMyc2F0cH0K
K1xlbmR7ZmlndXJlfQorCitcYmVnaW57ZmlndXJlfVtoIV0KK3tcZm9vdG5vdGVzaXplCitcYmVn
aW57Y2VudGVyfQorXGJlZ2lue3RhYnVsYXJ9e0B7fVNAe31UQHt9VX0KK1xpbnN0Yml0cmFuZ2V7
NjN9ezYwfSAmCitcaW5zdGJpdHJhbmdlezU5fXsxNn0gJgorXGluc3RiaXRyYW5nZXsxNX17MH0g
XFwKK1xobGluZQorXG11bHRpY29sdW1uezF9e3xjfH17e1x0dCBNT0RFfX0gJgorXG11bHRpY29s
dW1uezF9e3xjfH17e1x0dCBQUE4gKHJvb3QgcGFnZSB0YWJsZSl9fSAmCitcbXVsdGljb2x1bW57
MX17fGN8fXt7XHR0IEFTSUR9fSBcXAorXGhsaW5lCis0ICYgNDQgJiAxNiBcXAorXGVuZHt0YWJ1
bGFyfQorXGVuZHtjZW50ZXJ9Cit9CitcdnNwYWNley0wLjFpbn0KK1xjYXB0aW9ue1JWNjQgc2Zl
bmNlLnZtYSByczIgZm9ybWF0LCBmb3IgTU9ERSB2YWx1ZXMsIG9ubHkgaGlnaGVzdCBiaXQ6NjMg
aXMKK3ZhbGlkIGFuZCBvdGhlcnMgYXJlIHJlc2VydmVkLn0KK1xsYWJlbHtydjY0c2F0cH0KK1xl
bmR7ZmlndXJlfQogCiBcYmVnaW57Y29tbWVudGFyeX0KLUNvbnNlcXVlbnRseSwgb3RoZXIgaGFy
dHMgbXVzdCBiZSBub3RpZmllZCBzZXBhcmF0ZWx5IHdoZW4gdGhlCitUaGUgbW9kZSdzIGhpZ2hl
c3QgYml0IGNvdWxkIGNvbnRyb2wgc2ZlbmNlLnZtYSBiZWhhdmlvciB3aXRoIDE6YnJvYWRjYXN0
IG9yIDA6bG9jYWwuCitJZiBvbmx5IGhhdmUgbW9kZTpsb2NhbCwgb3RoZXIgaGFydHMgbXVzdCBi
ZSBub3RpZmllZCBzZXBhcmF0ZWx5IHdoZW4gdGhlCiBtZW1vcnktbWFuYWdlbWVudCBkYXRhIHN0
cnVjdHVyZXMgaGF2ZSBiZWVuIG1vZGlmaWVkLgogT25lIGFwcHJvYWNoIGlzIHRvIHVzZSAxKQog
YSBsb2NhbCBkYXRhIGZlbmNlIHRvIGVuc3VyZSBsb2NhbCB3cml0ZXMgYXJlIHZpc2libGUgZ2xv
YmFsbHksIHRoZW4KQEAgLTkyOCw4ICsxMDEyLDE3IEBAIG1vZGlmaWVkIGZvciBhIHNpbmdsZSBh
ZGRyZXNzIG1hcHBpbmcgKGkuZS4sIG9uZSBwYWdlIG9yIHN1cGVycGFnZSksIHtcZW0gcnMxfQog
Y2FuIHNwZWNpZnkgYSB2aXJ0dWFsIGFkZHJlc3Mgd2l0aGluIHRoYXQgbWFwcGluZyB0byBlZmZl
Y3QgYSB0cmFuc2xhdGlvbgogZmVuY2UgZm9yIHRoYXQgbWFwcGluZyBvbmx5LiAgRnVydGhlcm1v
cmUsIGZvciB0aGUgY29tbW9uIGNhc2UgdGhhdCB0aGUKIHRyYW5zbGF0aW9uIGRhdGEgc3RydWN0
dXJlcyBoYXZlIG9ubHkgYmVlbiBtb2RpZmllZCBmb3IgYSBzaW5nbGUgYWRkcmVzcy1zcGFjZQot
aWRlbnRpZmllciwge1xlbSByczJ9IGNhbiBzcGVjaWZ5IHRoZSBhZGRyZXNzIHNwYWNlLiAgVGhl
IGJlaGF2aW9yIG9mCi1TRkVOQ0UuVk1BIGRlcGVuZHMgb24ge1xlbSByczF9IGFuZCB7XGVtIHJz
Mn0gYXMgZm9sbG93czoKK2lkZW50aWZpZXIsIHtcZW0gcnMyfSBjYW4gc3BlY2lmeSB0aGUgYWRk
cmVzcyBzcGFjZSB3aXRoIHtcdHQgc2F0cH0gZm9ybWF0Cit3aGljaCBpbmNsdWRlIGFzaWQgYW5k
IHJvb3QgcGFnZSB0YWJsZSdzIFBQTiBpbmZvcm1hdGlvbi4KKworXGJlZ2lue2NvbW1lbnRhcnl9
CitXZSB1c2UgQVNJRCBhbmQgcm9vdCBwYWdlIHRhYmxlJ3MgUFBOIHRvIGRldGVybWluZSBhZGRy
ZXNzIHNwYWNlIGFuZCB0aGUgZm9ybWF0CitzdG9yZWQgaW4gcnMyIGlzIHNpbWlsYXIgd2l0aCB7
XHR0IHNhdHB9IGRlc2NyaWJlZCBpbiBTZWN0aW9uflxyZWZ7c2VjOnNhdHB9LgorQVNJRCBhcmUg
dXNlZCBieSBsb2NhbCBoYXJ0cyBhbmQgcm9vdCBwYWdlIHRhYmxlJ3MgUFBOIG9mIHRoZSBhc2lk
IGFyZSB1c2VkIGJ5CitvdGhlciBkaWZmZXJlbnQgVExCIHN5c3RlbXMsIGVnOiBJT01NVS4KK1xl
bmR7Y29tbWVudGFyeX0KKworVGhlIGJlaGF2aW9yIG9mIFNGRU5DRS5WTUEgZGVwZW5kcyBvbiB7
XGVtIHJzMX0gYW5kIHtcZW0gcnMyfSBhcyBmb2xsb3dzOgogCiBcYmVnaW57aXRlbWl6ZX0KIFxp
dGVtIElmIHtcZW0gcnMxfT17XHR0IHgwfSBhbmQge1xlbSByczJ9PXtcdHQgeDB9LCB0aGUgZmVu
Y2Ugb3JkZXJzIGFsbApAQCAtOTM5LDIzICsxMDMyLDE4IEBAIFNGRU5DRS5WTUEgZGVwZW5kcyBv
biB7XGVtIHJzMX0gYW5kIHtcZW0gcnMyfSBhcyBmb2xsb3dzOgogICAgICAgYWxsIHJlYWRzIGFu
ZCB3cml0ZXMgbWFkZSB0byBhbnkgbGV2ZWwgb2YgdGhlIHBhZ2UgdGFibGVzLCBidXQgb25seQog
ICAgICAgZm9yIHRoZSBhZGRyZXNzIHNwYWNlIGlkZW50aWZpZWQgYnkgaW50ZWdlciByZWdpc3Rl
ciB7XGVtIHJzMn0uCiAgICAgICBBY2Nlc3NlcyB0byB7XGVtIGdsb2JhbH0gbWFwcGluZ3MgKHNl
ZSBTZWN0aW9uflxyZWZ7c2VjOnRyYW5zbGF0aW9ufSkKLSAgICAgIGFyZSBub3Qgb3JkZXJlZC4K
KyAgICAgIGFyZSBub3Qgb3JkZXJlZC4gVGhlIG1vZGUgZmllbGQgaW4gcnMyIGlzIGRldGVybWlu
ZSBicm9hZGNhc3Qgb3IgbG9jYWwuCiBcaXRlbSBJZiB7XGVtIHJzMX0kXG5lcSR7XHR0IHgwfSBh
bmQge1xlbSByczJ9PXtcdHQgeDB9LCB0aGUgZmVuY2Ugb3JkZXJzCiAgICAgICBvbmx5IHJlYWRz
IGFuZCB3cml0ZXMgbWFkZSB0byB0aGUgbGVhZiBwYWdlIHRhYmxlIGVudHJ5IGNvcnJlc3BvbmRp
bmcKICAgICAgIHRvIHRoZSB2aXJ0dWFsIGFkZHJlc3MgaW4ge1xlbSByczF9LCBmb3IgYWxsIGFk
ZHJlc3Mgc3BhY2VzLgogXGl0ZW0gSWYge1xlbSByczF9JFxuZXEke1x0dCB4MH0gYW5kIHtcZW0g
cnMyfSRcbmVxJHtcdHQgeDB9LCB0aGUgZmVuY2UKICAgICAgIG9yZGVycyBvbmx5IHJlYWRzIGFu
ZCB3cml0ZXMgbWFkZSB0byB0aGUgbGVhZiBwYWdlIHRhYmxlIGVudHJ5CiAgICAgICBjb3JyZXNw
b25kaW5nIHRvIHRoZSB2aXJ0dWFsIGFkZHJlc3MgaW4ge1xlbSByczF9LCBmb3IgdGhlIGFkZHJl
c3MKLSAgICAgIHNwYWNlIGlkZW50aWZpZWQgYnkgaW50ZWdlciByZWdpc3RlciB7XGVtIHJzMn0u
CisgICAgICBzcGFjZSBpZGVudGlmaWVkIGJ5IGludGVnZXIgcmVnaXN0ZXIge1xlbSByczJ9LiBU
aGUgbW9kZSBmaWVsZCBpbiByczIKKyAgICAgIGlzIGRldGVybWluZSBicm9hZGNhc3Qgb3IgbG9j
YWwuCiAgICAgICBBY2Nlc3NlcyB0byBnbG9iYWwgbWFwcGluZ3MgYXJlIG5vdCBvcmRlcmVkLgog
XGVuZHtpdGVtaXplfQogCi1XaGVuIHtcZW0gcnMyfSRcbmVxJHtcdHQgeDB9LCBiaXRzIFNYTEVO
LTE6QVNJRE1BWCBvZiB0aGUgdmFsdWUgaGVsZCBpbiB7XGVtCi1yczJ9IGFyZSByZXNlcnZlZCBm
b3IgZnV0dXJlIHVzZSBhbmQgc2hvdWxkIGJlIHplcm9lZCBieSBzb2Z0d2FyZSBhbmQgaWdub3Jl
ZAotYnkgY3VycmVudCBpbXBsZW1lbnRhdGlvbnMuICBGdXJ0aGVybW9yZSwgaWYgQVNJRExFTn4k
PCR+QVNJRE1BWCwgdGhlCi1pbXBsZW1lbnRhdGlvbiBzaGFsbCBpZ25vcmUgYml0cyBBU0lETUFY
LTE6QVNJRExFTiBvZiB0aGUgdmFsdWUgaGVsZCBpbiB7XGVtCi1yczJ9LgotCiBcYmVnaW57Y29t
bWVudGFyeX0KIFNpbXBsZXIgaW1wbGVtZW50YXRpb25zIGNhbiBpZ25vcmUgdGhlIHZpcnR1YWwg
YWRkcmVzcyBpbiB7XGVtIHJzMX0gYW5kCiB0aGUgQVNJRCB2YWx1ZSBpbiB7XGVtIHJzMn0gYW5k
IGFsd2F5cyBwZXJmb3JtIGEgZ2xvYmFsIGZlbmNlLgpAQCAtOTk0LDcgKzEwODIsNyBAQCBjYW4g
ZXhlY3V0ZSB0aGUgc2FtZSBTRkVOQ0UuVk1BIGluc3RydWN0aW9uIHdoaWxlIGEgZGlmZmVyZW50
IEFTSUQgaXMgbG9hZGVkCiBpbnRvIHtcdHQgc2F0cH0sIHByb3ZpZGVkIHRoZSBuZXh0IHRpbWUg
e1x0dCBzYXRwfSBpcyBsb2FkZWQgd2l0aCB0aGUgcmVjeWNsZWQKIEFTSUQsIGl0IGlzIHNpbXVs
dGFuZW91c2x5IGxvYWRlZCB3aXRoIHRoZSBuZXcgcGFnZSB0YWJsZS4KIAotXGl0ZW0gSWYgdGhl
IGltcGxlbWVudGF0aW9uIGRvZXMgbm90IHByb3ZpZGUgQVNJRHMsIG9yIHNvZnR3YXJlIGNob29z
ZXMgdG8KK1xpdGVtIElmIHRoZSBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdCBwcm92aWRlIEFTSURz
IGFuZCBQUE5zLCBvciBzb2Z0d2FyZSBjaG9vc2VzIHRvCiBhbHdheXMgdXNlIEFTSUQgMCwgdGhl
biBhZnRlciBldmVyeSB7XHR0IHNhdHB9IHdyaXRlLCBzb2Z0d2FyZSBzaG91bGQgZXhlY3V0ZQog
U0ZFTkNFLlZNQSB3aXRoIHtcZW0gcnMxfT17XHR0IHgwfS4gIEluIHRoZSBjb21tb24gY2FzZSB0
aGF0IG5vIGdsb2JhbAogdHJhbnNsYXRpb25zIGhhdmUgYmVlbiBtb2RpZmllZCwge1xlbSByczJ9
IHNob3VsZCBiZSBzZXQgdG8gYSByZWdpc3RlciBvdGhlciB0aGFuCkBAIC0xMDAzLDEzICsxMDkx
LDE0IEBAIG5vdCBmbHVzaGVkLgogCiBcaXRlbSBJZiBzb2Z0d2FyZSBtb2RpZmllcyBhIG5vbi1s
ZWFmIFBURSwgaXQgc2hvdWxkIGV4ZWN1dGUgU0ZFTkNFLlZNQSB3aXRoCiB7XGVtIHJzMX09e1x0
dCB4MH0uICBJZiBhbnkgUFRFIGFsb25nIHRoZSB0cmF2ZXJzYWwgcGF0aCBoYWQgaXRzIEcgYml0
IHNldCwKLXtcZW0gcnMyfSBtdXN0IGJlIHtcdHQgeDB9OyBvdGhlcndpc2UsIHtcZW0gcnMyfSBz
aG91bGQgYmUgc2V0IHRvIHRoZSBBU0lEIGZvcgotd2hpY2ggdGhlIHRyYW5zbGF0aW9uIGlzIGJl
aW5nIG1vZGlmaWVkLgore1xlbSByczJ9IG11c3QgYmUge1x0dCB4MH07IG90aGVyd2lzZSwge1xl
bSByczJ9IHNob3VsZCBiZSBzZXQgdG8gdGhlIEFTSUQgYW5kCityb290IHBhZ2UgdGFibGUncyBQ
UE4gZm9yIHdoaWNoIHRoZSB0cmFuc2xhdGlvbiBpcyBiZWluZyBtb2RpZmllZC4KIAogXGl0ZW0g
SWYgc29mdHdhcmUgbW9kaWZpZXMgYSBsZWFmIFBURSwgaXQgc2hvdWxkIGV4ZWN1dGUgU0ZFTkNF
LlZNQSB3aXRoIHtcZW0KIHJzMX0gc2V0IHRvIGEgdmlydHVhbCBhZGRyZXNzIHdpdGhpbiB0aGUg
cGFnZS4gIElmIGFueSBQVEUgYWxvbmcgdGhlIHRyYXZlcnNhbAogcGF0aCBoYWQgaXRzIEcgYml0
IHNldCwge1xlbSByczJ9IG11c3QgYmUge1x0dCB4MH07IG90aGVyd2lzZSwge1xlbSByczJ9Ci1z
aG91bGQgYmUgc2V0IHRvIHRoZSBBU0lEIGZvciB3aGljaCB0aGUgdHJhbnNsYXRpb24gaXMgYmVp
bmcgbW9kaWZpZWQuCitzaG91bGQgYmUgc2V0IHRvIHRoZSBBU0lEIGFuZCByb290IHBhZ2UgdGFi
bGUncyBQUE4gZm9yIHdoaWNoIHRoZSB0cmFuc2xhdGlvbgoraXMgYmVpbmcgbW9kaWZpZWQuCiAK
IFxpdGVtIEZvciB0aGUgc3BlY2lhbCBjYXNlcyBvZiBpbmNyZWFzaW5nIHRoZSBwZXJtaXNzaW9u
cyBvbiBhIGxlYWYgUFRFIGFuZAogY2hhbmdpbmcgYW4gaW52YWxpZCBQVEUgdG8gYSB2YWxpZCBs
ZWFmLCBzb2Z0d2FyZSBtYXkgY2hvb3NlIHRvIGV4ZWN1dGUKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QK
aW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
