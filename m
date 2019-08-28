Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE98DA05B8
	for <lists.iommu@lfdr.de>; Wed, 28 Aug 2019 17:08:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D57C73116;
	Wed, 28 Aug 2019 15:08:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 962CF2B9C
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 15:08:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 43CA3887
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 15:08:11 +0000 (UTC)
Received: from theinternet.molgen.mpg.de (theinternet.molgen.mpg.de
	[141.14.31.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: buczek)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id C528920225535;
	Wed, 28 Aug 2019 17:08:08 +0200 (CEST)
Subject: Re: /proc/vmcore and wrong PAGE_OFFSET
From: Donald Buczek <buczek@molgen.mpg.de>
To: iommu@lists.linux-foundation.org, linux-pci@vger.kernel.org,
	x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Menzel <pmenzel@molgen.mpg.de>
References: <c42060b0-12ae-d170-9ad4-03d85919948c@molgen.mpg.de>
Message-ID: <b208dccd-63d9-e902-28e1-3a6cb44f082f@molgen.mpg.de>
Date: Wed, 28 Aug 2019 17:08:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c42060b0-12ae-d170-9ad4-03d85919948c@molgen.mpg.de>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: horms@verge.net.au, kexec@lists.infradead.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

T24gOC8yMC8xOSAxMToyMSBQTSwgRG9uYWxkIEJ1Y3playB3cm90ZToKPiBEZWFyIExpbnV4IGZv
bGtzLAo+IAo+IEknbSBpbnZlc3RpZ2F0aW5nIGEgcHJvYmxlbSwgdGhhdCB0aGUgY3Jhc2ggdXRp
bGl0eSBmYWlscyB0byB3b3JrIHdpdGggb3VyIGNyYXNoIGR1bXBzOgo+IAo+ICDCoMKgwqAgYnVj
emVrQGtyZWlvczovbW50JCBjcmFzaCB2bWxpbnV4IGNyYXNoLnZtY29yZQo+ICDCoMKgwqAgY3Jh
c2ggNy4yLjYKPiAgwqDCoMKgIENvcHlyaWdodCAoQykgMjAwMi0yMDE5wqAgUmVkIEhhdCwgSW5j
Lgo+ICDCoMKgwqAgQ29weXJpZ2h0IChDKSAyMDA0LCAyMDA1LCAyMDA2LCAyMDEwwqAgSUJNIENv
cnBvcmF0aW9uCj4gIMKgwqDCoCBDb3B5cmlnaHQgKEMpIDE5OTktMjAwNsKgIEhld2xldHQtUGFj
a2FyZCBDbwo+ICDCoMKgwqAgQ29weXJpZ2h0IChDKSAyMDA1LCAyMDA2LCAyMDExLCAyMDEywqAg
RnVqaXRzdSBMaW1pdGVkCj4gIMKgwqDCoCBDb3B5cmlnaHQgKEMpIDIwMDYsIDIwMDfCoCBWQSBM
aW51eCBTeXN0ZW1zIEphcGFuIEsuSy4KPiAgwqDCoMKgIENvcHlyaWdodCAoQykgMjAwNSwgMjAx
McKgIE5FQyBDb3Jwb3JhdGlvbgo+ICDCoMKgwqAgQ29weXJpZ2h0IChDKSAxOTk5LCAyMDAyLCAy
MDA3wqAgU2lsaWNvbiBHcmFwaGljcywgSW5jLgo+ICDCoMKgwqAgQ29weXJpZ2h0IChDKSAxOTk5
LCAyMDAwLCAyMDAxLCAyMDAywqAgTWlzc2lvbiBDcml0aWNhbCBMaW51eCwgSW5jLgo+ICDCoMKg
wqAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmUsIGNvdmVyZWQgYnkgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlLAo+ICDCoMKgwqAgYW5kIHlvdSBhcmUgd2VsY29tZSB0byBjaGFu
Z2UgaXQgYW5kL29yIGRpc3RyaWJ1dGUgY29waWVzIG9mIGl0IHVuZGVyCj4gIMKgwqDCoCBjZXJ0
YWluIGNvbmRpdGlvbnMuwqAgRW50ZXIgImhlbHAgY29weWluZyIgdG8gc2VlIHRoZSBjb25kaXRp
b25zLgo+ICDCoMKgwqAgVGhpcyBwcm9ncmFtIGhhcyBhYnNvbHV0ZWx5IG5vIHdhcnJhbnR5LsKg
IEVudGVyICJoZWxwIHdhcnJhbnR5IiBmb3IgZGV0YWlscy4KPiAgwqDCoMKgIEdOVSBnZGIgKEdE
QikgNy42Cj4gIMKgwqDCoCBDb3B5cmlnaHQgKEMpIDIwMTMgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLCBJbmMuCj4gIMKgwqDCoCBMaWNlbnNlIEdQTHYzKzogR05VIEdQTCB2ZXJzaW9uIDMgb3Ig
bGF0ZXIgPGh0dHA6Ly9nbnUub3JnL2xpY2Vuc2VzL2dwbC5odG1sPgo+ICDCoMKgwqAgVGhpcyBp
cyBmcmVlIHNvZnR3YXJlOiB5b3UgYXJlIGZyZWUgdG8gY2hhbmdlIGFuZCByZWRpc3RyaWJ1dGUg
aXQuCj4gIMKgwqDCoCBUaGVyZSBpcyBOTyBXQVJSQU5UWSwgdG8gdGhlIGV4dGVudCBwZXJtaXR0
ZWQgYnkgbGF3LsKgIFR5cGUgInNob3cgY29weWluZyIKPiAgwqDCoMKgIGFuZCAic2hvdyB3YXJy
YW50eSIgZm9yIGRldGFpbHMuCj4gIMKgwqDCoCBUaGlzIEdEQiB3YXMgY29uZmlndXJlZCBhcyAi
eDg2XzY0LXVua25vd24tbGludXgtZ251Ii4uLgo+ICDCoMKgwqAgY3Jhc2g6IHJlYWQgZXJyb3I6
IGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3M6IGZmZmY4OTgwN2ZmNzcwMDDCoCB0eXBlOiAibWVtb3J5
IHNlY3Rpb24gcm9vdCB0YWJsZSIKPiAKPiBUaGUgY3Jhc2ggZmlsZSBpcyBhIGNvcHkgb2YgL2Rl
di92bWNvcmUgdGFrZW4gYnkgYSBjcmFzaGtlcm5lbCBhZnRlciBhIHN5c2N0bC1mb3JjZWQgcGFu
aWMuCj4gCj4gSXQgbG9va3MgdG8gbWUsIHRoYXTCoCAweGZmZmY4OTgwN2ZmNzcwMDAgaXMgbm90
IHJlYWRhYmxlLCBiZWNhdXNlIHRoZSB2aXJ0dWFsIGFkZHJlc3NlcyBzdG9yZWQgaW4gdGhlIGVs
ZiBoZWFkZXIgb2YgdGhlIGR1bXAgZmlsZSBhcmUgb2ZmIGJ5IDB4MDAwMDAwODAwMDAwMDAwMDoK
PiAKPiAgwqDCoMKgIGJ1Y3pla0BrcmVpb3M6L21udCQgcmVhZGVsZiAtYSBjcmFzaC52bWNvcmUg
fCBncmVwIExPQUQgfCBwZXJsIC1sYW5lICdwcmludGYgIiVzICglMDE2eClcbiIsJF8saGV4KCRG
WzJdKS1oZXgoJEZbM10pJwo+ICDCoMKgwqDCoMKgIExPQUTCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
eDAwMDAwMDAwMDAwMGQwMDAgMHhmZmZmZmZmZjgxMDAwMDAwIDB4MDAwMDAxMDA3ZDAwMDAwMCAo
ZmZmZmZlZmYwNDAwMDAwMCkKPiAgwqDCoMKgwqDCoCBMT0FEwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MHgwMDAwMDAwMDAxYzMzMDAwIDB4ZmZmZjg4MDAwMDAwMTAwMCAweDAwMDAwMDAwMDAwMDEwMDAg
KGZmZmY4ODAwMDAwMDAwMDApCj4gIMKgwqDCoMKgwqAgTE9BRMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDB4MDAwMDAwMDAwMWNjMTAwMCAweGZmZmY4ODAwMDAwOTAwMDAgMHgwMDAwMDAwMDAwMDkwMDAw
IChmZmZmODgwMDAwMDAwMDAwKQo+ICDCoMKgwqDCoMKgIExPQUTCoMKgwqDCoMKgwqDCoMKgwqDC
oCAweDAwMDAwMDAwMDFjZDEwMDAgMHhmZmZmODgwMDAwMTAwMDAwIDB4MDAwMDAwMDAwMDEwMDAw
MCAoZmZmZjg4MDAwMDAwMDAwMCkKPiAgwqDCoMKgwqDCoCBMT0FEwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMHgwMDAwMDAwMDAxY2QyMDcwIDB4ZmZmZjg4MDAwMDEwMDA3MCAweDAwMDAwMDAwMDAxMDAw
NzAgKGZmZmY4ODAwMDAwMDAwMDApCj4gIMKgwqDCoMKgwqAgTE9BRMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDB4MDAwMDAwMDAxOWJkMjAwMCAweGZmZmY4ODAwMzgwMDAwMDAgMHgwMDAwMDAwMDM4MDAw
MDAwIChmZmZmODgwMDAwMDAwMDAwKQo+ICDCoMKgwqDCoMKgIExPQUTCoMKgwqDCoMKgwqDCoMKg
wqDCoCAweDAwMDAwMDAwNGU2YTEwMDAgMHhmZmZmODgwMDZmZmZmMDAwIDB4MDAwMDAwMDA2ZmZm
ZjAwMCAoZmZmZjg4MDAwMDAwMDAwMCkKPiAgwqDCoMKgwqDCoCBMT0FEwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMHgwMDAwMDAwMDRlNmEyMDAwIDB4ZmZmZjg4MDEwMDAwMDAwMCAweDAwMDAwMDAxMDAw
MDAwMDAgKGZmZmY4ODAwMDAwMDAwMDApCj4gIMKgwqDCoMKgwqAgTE9BRMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDB4MDAwMDAwMWZjZGEyMjAwMCAweGZmZmY4ODIwODAwMDAwMDAgMHgwMDAwMDAyMDgw
MDAwMDAwIChmZmZmODgwMDAwMDAwMDAwKQo+ICDCoMKgwqDCoMKgIExPQUTCoMKgwqDCoMKgwqDC
oMKgwqDCoCAweDAwMDAwMDNmY2Q5YTIwMDAgMHhmZmZmODg0MDgwMDAwMDAwIDB4MDAwMDAwNDA4
MDAwMDAwMCAoZmZmZjg4MDAwMDAwMDAwMCkKPiAgwqDCoMKgwqDCoCBMT0FEwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMHgwMDAwMDA1ZmNkOTIyMDAwIDB4ZmZmZjg4NjA4MDAwMDAwMCAweDAwMDAwMDYw
ODAwMDAwMDAgKGZmZmY4ODAwMDAwMDAwMDApCj4gIMKgwqDCoMKgwqAgTE9BRMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDB4MDAwMDAwN2ZjZDhhMjAwMCAweGZmZmY4ODgwODAwMDAwMDAgMHgwMDAwMDA4
MDgwMDAwMDAwIChmZmZmODgwMDAwMDAwMDAwKQo+ICDCoMKgwqDCoMKgIExPQUTCoMKgwqDCoMKg
wqDCoMKgwqDCoCAweDAwMDAwMDlmY2Q4MjIwMDAgMHhmZmZmODhhMDgwMDAwMDAwIDB4MDAwMDAw
YTA4MDAwMDAwMCAoZmZmZjg4MDAwMDAwMDAwMCkKPiAgwqDCoMKgwqDCoCBMT0FEwqDCoMKgwqDC
oMKgwqDCoMKgwqAgMHgwMDAwMDBiZmNkN2EyMDAwIDB4ZmZmZjg4YzA4MDAwMDAwMCAweDAwMDAw
MGMwODAwMDAwMDAgKGZmZmY4ODAwMDAwMDAwMDApCj4gIMKgwqDCoMKgwqAgTE9BRMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDB4MDAwMDAwZGZjZDcyMjAwMCAweGZmZmY4OGUwODAwMDAwMDAgMHgwMDAw
MDBlMDgwMDAwMDAwIChmZmZmODgwMDAwMDAwMDAwKQo+ICDCoMKgwqDCoMKgIExPQUTCoMKgwqDC
oMKgwqDCoMKgwqDCoCAweDAwMDAwMGZjNGQ3MjIwMDAgMHhmZmZmODhmZTAwMDAwMDAwIDB4MDAw
MDAwZmUwMDAwMDAwMCAoZmZmZjg4MDAwMDAwMDAwMCkKPiAKPiAoQ29sdW1ucyBhcmUgRmlsZSBv
ZmZzZXQsIFZpcnR1YWwgQWRkcmVzcywgUGh5c2ljYWwgQWRkcmVzcyBhbmQgY29tcHV0ZWQgb2Zm
c2V0KS4KPiAKPiBJIHdvdWxkIGV4cGVjdCB0aGUgb2Zmc2V0IGJldHdlZW4gdGhlIHZpcnR1YWwg
YW5kIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHRvIGJlIFBBR0VfT0ZGU0VULCB3aGljaCBpcyAweGZm
ZmY4ODgwMDAwMDAwMCBvbiB4ODZfNjQsIG5vdCAweGZmZmY4ODAwMDAwMDAwMDAuIFVubGlrZSAv
cHJvYy92bWNvcmUsIC9wcm9jL2tjb3JlIHNob3dzIHRoZSBzYW1lIHBoeXNpY2FsIG1lbW9yeSAo
b2YgdGhlIGxhc3QgbWVtb3J5IHNlY3Rpb24gYWJvdmUpIHdpdGggYSBjb3JyZWN0IG9mZnNldDoK
PiAKPiAgwqDCoMKgIGJ1Y3pla0BrcmVpb3M6L21udCQgc3VkbyByZWFkZWxmIC1hIC9wcm9jL2tj
b3JlIHwgZ3JlcCAweDAwMDAwMGZlMDAwMDAwMDAgfCBwZXJsIC1sYW5lICdwcmludGYgIiVzICgl
MDE2eClcbiIsJF8saGV4KCRGWzJdKS1oZXgoJEZbM10pJwo+ICDCoMKgwqDCoMKgIExPQUTCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweDAwMDAwOTdlMDAwMDQwMDAgMHhmZmZmODk3ZTAwMDAwMDAwIDB4
MDAwMDAwZmUwMDAwMDAwMCAoZmZmZjg4ODAwMDAwMDAwMCkKPiAKPiBUaGUgZmFpbGluZyBhZGRy
ZXNzIDB4ZmZmZjg5ODA3ZmY3NzAwMCBoYXBwZW5zIHRvIGJlIGF0IHRoZSBlbmQgb2YgdGhlIGxh
c3QgbWVtb3J5IHNlY3Rpb24uIEl0IGlzIHRoZSBtZW1fc2VjdGlvbiBhcnJheSwgd2hpY2ggY3Jh
c2ggd2FudHMgdG8gbG9hZCBhbmQgd2hpY2ggaXMgdmlzaWJsZSBpbiB0aGUgcnVubmluZyBzeXN0
ZW06Cj4gCj4gIMKgwqDCoCBidWN6ZWtAa3JlaW9zOi9tbnQkIHN1ZG8gZ2RiIHZtbGludXggL3By
b2Mva2NvcmUKPiAgwqDCoMKgIFsuLi5dCj4gIMKgwqDCoCAoZ2RiKSBwcmludCBtZW1fc2VjdGlv
bgo+ICDCoMKgwqAgJDEgPSAoc3RydWN0IG1lbV9zZWN0aW9uICoqKSAweGZmZmY4OTgwN2ZmNzcw
MDAKPiAgwqDCoMKgIChnZGIpIHByaW50ICptZW1fc2VjdGlvbgo+ICDCoMKgwqAgJDIgPSAoc3Ry
dWN0IG1lbV9zZWN0aW9uICopIDB4ZmZmZjg4YTA3ZjM3YjAwMAo+ICDCoMKgwqAgKGdkYikgcHJp
bnQgKiptZW1fc2VjdGlvbgo+ICDCoMKgwqAgJDMgPSB7c2VjdGlvbl9tZW1fbWFwID0gMTg0NDY3
MTk4ODQ0NTM3NDA1NTEsIHBhZ2VibG9ja19mbGFncyA9IDB4ZmZmZjg4YTA3ZjM2ZjA0MH0KPiAK
PiBJIGNhbiByZWFkIHRoZSBzYW1lIGluZm9ybWF0aW9uIGZyb20gdGhlIGNyYXNoIGR1bXAsIGlm
IEkgYWNjb3VudCBmb3IgdGhlIDB4MDAwMDAwODAwMDAwMDAwMCBlcnJvcjoKPiAKPiAgwqDCoMKg
IGJ1Y3pla0BrcmVpb3M6L21udCQgZ2RiIHZtbGludXggY3Jhc2gudm1jb3JlCj4gIMKgwqDCoCBb
Li4uXQo+ICDCoMKgwqAgKGdkYikgcHJpbnQgbWVtX3NlY3Rpb24KPiAgwqDCoMKgICQxID0gKHN0
cnVjdCBtZW1fc2VjdGlvbiAqKikgMHhmZmZmODk4MDdmZjc3MDAwCj4gIMKgwqDCoCAoZ2RiKSBw
cmludCAqbWVtX3NlY3Rpb24KPiAgwqDCoMKgIENhbm5vdCBhY2Nlc3MgbWVtb3J5IGF0IGFkZHJl
c3MgMHhmZmZmODk4MDdmZjc3MDAwCj4gIMKgwqDCoCAoZ2RiKSBzZXQgJHQ9KHN0cnVjdCBtZW1f
c2VjdGlvbiAqKikgKChjaGFyICopbWVtX3NlY3Rpb24gLSAweDAwMDAwMDgwMDAwMDAwMDApCj4g
IMKgwqDCoCAoZ2RiKSBwcmludCAqJHQKPiAgwqDCoMKgICQyID0gKHN0cnVjdCBtZW1fc2VjdGlv
biAqKSAweGZmZmY4OGEwN2YzN2IwMDAKPiAgwqDCoMKgIChnZGIpIHNldCAkcz0oc3RydWN0IG1l
bV9zZWN0aW9uICopKChjaGFyICopKiR0IC0gMHgwMDAwMDA4MDAwMDAwMDAwICkKPiAgwqDCoMKg
IChnZGIpIHByaW50ICokcwo+ICDCoMKgwqAgJDMgPSB7c2VjdGlvbl9tZW1fbWFwID0gMTg0NDY3
MTk4ODQ0NTM3NDA1NTEsIHBhZ2VibG9ja19mbGFncyA9IDB4ZmZmZjg4YTA3ZjM2ZjA0MH0KPiAK
PiBJbiB0aGUgYWJvdmUgZXhhbXBsZSwgdGhlIHJ1bm5pbmcga2VybmVsLCB0aGUgY3Jhc2hlZCBr
ZXJuZWwgYW5kIHRoZSBjcmFzaGtlcm5lbCBhcmUgYWxsIHRoZSBzYW1lIDQuMTkuNTcgY29tcGls
YXRpb24uIEJ1dCBJJ3ZlIHRyaWVkIHdpdGggc2V2ZXJhbCBvdGhlciB2ZXJzaW9ucyAoIGNyYXNo
a2VybmVsIDQuNCwgcnVubmluZyBrZXJuZWwgZnJvbSA0LjAgdG8gbGludXggbWFzdGVyKSB3aXRo
IHRoZSBzYW1lIHJlc3VsdC4KPiAKPiBUaGUgbWFjaGluZSBpbiB0aGUgYWJvdmUgZXhhbXBsZSBo
YXMgc2V2ZXJhbCBudW1hIG5vZGVzICh0aGlzIGlzIHdoeSB0aGVyZSBhcmUgc28gbWFueSBMT0FE
IGhlYWRlcnMpLiBCdXQgSSd2ZSB0cmllZCB0aGlzIHdpdGggYSBzbWFsbCBrdm0gdmlydHVhbCBt
YWNoaW5lIGFuZCBnb3QgdGhlIHNhbWUgcmVzdWx0Lgo+IAo+ICDCoMKgwqAgYnVjemVrQGtyZWlv
czovbW50L2xpbnV4LTQuMTkuNTctMjg2Lng4Nl82NC9idWlsZCQgZ3JlcCBSQU5ET01JWkVfQkFT
RSAuY29uZmlnCj4gIMKgwqDCoCAjIENPTkZJR19SQU5ET01JWkVfQkFTRSBpcyBub3Qgc2V0Cj4g
IMKgwqDCoCBidWN6ZWtAa3JlaW9zOi9tbnQvbGludXgtNC4xOS41Ny0yODYueDg2XzY0L2J1aWxk
JCBncmVwIFNQQVJTRU1FTSAuY29uZmlnCj4gIMKgwqDCoCBDT05GSUdfQVJDSF9TUEFSU0VNRU1f
RU5BQkxFPXkKPiAgwqDCoMKgIENPTkZJR19BUkNIX1NQQVJTRU1FTV9ERUZBVUxUPXkKPiAgwqDC
oMKgIENPTkZJR19TUEFSU0VNRU1fTUFOVUFMPXkKPiAgwqDCoMKgIENPTkZJR19TUEFSU0VNRU09
eQo+ICDCoMKgwqAgQ09ORklHX1NQQVJTRU1FTV9FWFRSRU1FPXkKPiAgwqDCoMKgIENPTkZJR19T
UEFSU0VNRU1fVk1FTU1BUF9FTkFCTEU9eQo+ICDCoMKgwqAgQ09ORklHX1NQQVJTRU1FTV9WTUVN
TUFQPXkKPiAgwqDCoMKgIGJ1Y3pla0BrcmVpb3M6L21udC9saW51eC00LjE5LjU3LTI4Ni54ODZf
NjQvYnVpbGQkIGdyZXAgUEFHRV9UQUJMRV9JU09MQVRJT04gLmNvbmZpZwo+ICDCoMKgwqAgQ09O
RklHX1BBR0VfVEFCTEVfSVNPTEFUSU9OPXkKPiAKPiBBbnkgaWRlYXM/Cj4gCj4gRG9uYWxkCgpU
byBhbnN3ZXIgbXkgb3duIHF1ZXN0aW9uIGZvciB0aGUgcmVjb3JkczoKCk91ciBrZXhlYyBjb21t
YW5kIGxpbmUgaXMKCiAgICAgL3Vzci9zYmluL2tleGVjIC1wIC9ib290L2J6SW1hZ2UuY3Jhc2gg
LS1pbml0cmQ9L2Jvb3QvZ3J1Yi9pbml0cmFtZnMuaWd6IC0tY29tbWFuZC1saW5lPSJyb290PUxB
QkVMPXJvb3Qgcm8gY29uc29sZT10dHlTMSwxMTUyMDBuOCBjb25zb2xlPXR0eTAgaXJxcG9sbCBu
cl9jcHVzPTEgcmVzZXRfZGV2aWNlcyBwYW5pYz01IENSQVNIIgoKU28gd2UgbmVpdGhlciBnYXZl
IC1zICgtLWtleGVjLWZpbGUtc3lzY2FsbCkgbm9yIC1hICggLS1rZXhlYy1zeXNjYWxsLWF1dG8g
KS4gRm9yIHRoaXMgcmVhc29uLCBrZXhlYyB1c2VkIHRoZSBrZXhlY19sb2FkKCkgc3lzY2FsbCBp
bnN0ZWFkIG9mIHRoZSBuZXdlciBrZXhlY19maWxlX2xvYWQgc3lzY2FsbC4KCldpdGgga2V4ZWNf
bG9hZCgpLCB0aGUgZWxmIGhlYWRlcnMgZm9yIHRoZSBjcmFzaCwgd2hpY2ggaW5jbHVkZSBwcm9n
cmFtIGhlYWRlciBmb3IgdGhlIG9sZCBzeXN0ZW0gcmFtLCBhcmUgbm90IGNvbXB1dGVkIGJ5IHRo
ZSBrZXJuZWwsIGJ1dCBieSB0aGUgdXNlcnNwYWNlIHByb2dyYW0gZnJvbSBrZXhlYy10b29scy4K
CkxpbnV4IGtlcm5lbCBjb21taXQgZDUyODg4YWEgKCJ4ODYvbW06IE1vdmUgTERUIHJlbWFwIG91
dCBvZiBLQVNMUiByZWdpb24gb24gNS1sZXZlbCBwYWdpbmciKSBjaGFuZ2VkIHRoZSBiYXNlIG9m
IHRoZSBkaXJlY3QgbWFwcGluZyBmcm9tIDB4ZmZmZjg4MDAwMDAwMDAwMCB0byAweGZmZmY4ODgw
MDAwMDAwMDAuIFRoaXMgd2FzIG1lcmdlZCBpbnRvIHY0LjIwLXJjMi4KCmtleGVjLXRvb2xzLCBo
b3dldmVyLCBzdGlsbCBoYXMgdGhlIG9sZCBhZGRyZXNzIGhhcmQgY29kZWQ6CgogICAgIGJ1Y3pl
a0BhdmFyaXRpYTovc2NyYXRjaC9jbHVzdGVyL2J1Y3play9rZXhlYy10b29scyAobWFzdGVyKSQg
Z2l0IGdyZXAgWDg2XzY0X1BBR0VfT0ZGU0VUCiAgICAga2V4ZWMvYXJjaC9pMzg2L2NyYXNoZHVt
cC14ODYuYzogICAgICAgICAgICAgICAgICAgICAgICBlbGZfaW5mby0+cGFnZV9vZmZzZXQgPSBY
ODZfNjRfUEFHRV9PRkZTRVRfUFJFXzJfNl8yNzsKICAgICBrZXhlYy9hcmNoL2kzODYvY3Jhc2hk
dW1wLXg4Ni5jOiAgICAgICAgICAgICAgICAgICAgICAgIGVsZl9pbmZvLT5wYWdlX29mZnNldCA9
IFg4Nl82NF9QQUdFX09GRlNFVDsKICAgICBrZXhlYy9hcmNoL2kzODYvY3Jhc2hkdW1wLXg4Ni5o
OiNkZWZpbmUgWDg2XzY0X1BBR0VfT0ZGU0VUX1BSRV8yXzZfMjcgICAweGZmZmY4MTAwMDAwMDAw
MDBVTEwKICAgICBrZXhlYy9hcmNoL2kzODYvY3Jhc2hkdW1wLXg4Ni5oOiNkZWZpbmUgWDg2XzY0
X1BBR0VfT0ZGU0VUICAgICAgICAgICAgICAweGZmZmY4ODAwMDAwMDAwMDBVTEwKCkJlc3QKICAg
RG9uYWxkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlv
bW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
