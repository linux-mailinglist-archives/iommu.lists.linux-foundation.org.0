Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604741A8F
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 05:09:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 459F414F4;
	Wed, 12 Jun 2019 03:09:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B29414EB
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 03:07:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8688576D
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 03:07:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2019 20:07:21 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga004.jf.intel.com with ESMTP; 11 Jun 2019 20:07:15 -0700
Subject: Re: [PATCH v4 0/9] iommu: Bounce page for untrusted devices
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190603011620.31999-1-baolu.lu@linux.intel.com>
	<20190610154241.GS28796@char.us.oracle.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <cd66dab1-9a18-13c1-e668-417036e2dbc1@linux.intel.com>
Date: Wed, 12 Jun 2019 11:00:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190610154241.GS28796@char.us.oracle.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alan.cox@intel.com, Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Jonathan Corbet <corbet@lwn.net>, pengfei.xu@intel.com,
	Ingo Molnar <mingo@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, kevin.tian@intel.com,
	Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	mika.westerberg@linux.intel.com, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	jacob.jun.pan@intel.com, Robin Murphy <robin.murphy@arm.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 6/10/19 11:42 PM, Konrad Rzeszutek Wilk wrote:
> On Mon, Jun 03, 2019 at 09:16:11AM +0800, Lu Baolu wrote:
>> The Thunderbolt vulnerabilities are public and have a nice
>> name as Thunderclap [1] [3] nowadays. This patch series aims
>> to mitigate those concerns.
>>
>> An external PCI device is a PCI peripheral device connected
>> to the system through an external bus, such as Thunderbolt.
>> What makes it different is that it can't be trusted to the
>> same degree as the devices build into the system. Generally,
>> a trusted PCIe device will DMA into the designated buffers
>> and not overrun or otherwise write outside the specified
>> bounds. But it's different for an external device.
>>
>> The minimum IOMMU mapping granularity is one page (4k), so
>> for DMA transfers smaller than that a malicious PCIe device
>> can access the whole page of memory even if it does not
>> belong to the driver in question. This opens a possibility
>> for DMA attack. For more information about DMA attacks
>> imposed by an untrusted PCI/PCIe device, please refer to [2].
>>
>> This implements bounce buffer for the untrusted external
>> devices. The transfers should be limited in isolated pages
>> so the IOMMU window does not cover memory outside of what
>> the driver expects. Previously (v3 and before), we proposed
>> an optimisation to only copy the head and tail of the buffer
>> if it spans multiple pages, and directly map the ones in the
>> middle. Figure 1 gives a big picture about this solution.
>>
>>                                  swiotlb             System
>>                  IOVA          bounce page           Memory
>>               .---------.      .---------.        .---------.
>>               |         |      |         |        |         |
>>               |         |      |         |        |         |
>> buffer_start .---------.      .---------.        .---------.
>>               |         |----->|         |*******>|         |
>>               |         |      |         | swiotlb|         |
>>               |         |      |         | mapping|         |
>>   IOMMU Page  '---------'      '---------'        '---------'
>>    Boundary   |         |                         |         |
>>               |         |                         |         |
>>               |         |                         |         |
>>               |         |------------------------>|         |
>>               |         |    IOMMU mapping        |         |
>>               |         |                         |         |
>>   IOMMU Page  .---------.                         .---------.
>>    Boundary   |         |                         |         |
>>               |         |                         |         |
>>               |         |------------------------>|         |
>>               |         |     IOMMU mapping       |         |
>>               |         |                         |         |
>>               |         |                         |         |
>>   IOMMU Page  .---------.      .---------.        .---------.
>>    Boundary   |         |      |         |        |         |
>>               |         |      |         |        |         |
>>               |         |----->|         |*******>|         |
>>    buffer_end '---------'      '---------' swiotlb'---------'
>>               |         |      |         | mapping|         |
>>               |         |      |         |        |         |
>>               '---------'      '---------'        '---------'
>>            Figure 1: A big view of iommu bounce page
>>
>> As Robin Murphy pointed out, this ties us to using strict mode for
>> TLB maintenance, which may not be an overall win depending on the
>> balance between invalidation bandwidth vs. memcpy bandwidth. If we
>> use standard SWIOTLB logic to always copy the whole thing, we should
>> be able to release the bounce pages via the flush queue to allow
>> 'safe' lazy unmaps. So since v4 we start to use the standard swiotlb
>> logic.
>>
>>                                  swiotlb             System
>>                  IOVA          bounce page           Memory
>> buffer_start .---------.      .---------.        .---------.
>>               |         |      |         |        |         |
>>               |         |      |         |        |         |
>>               |         |      |         |        .---------.physical
>>               |         |----->|         | ------>|         |_start
>>               |         |iommu |         | swiotlb|         |
>>               |         | map  |         |   map  |         |
>>   IOMMU Page  .---------.      .---------.        '---------'
> 
> The prior picture had 'buffer_start' at an offset in the page. I am
> assuming you meant that here in as well?

In prior picture, since we only use bounce buffer for head and tail
partial-page buffers, so we need to return buffer_start at the same
offset as the physical buffer.

Here, we use a whole swiotlb bounce buffer, hence we should use the same
offset as the bounce buffer (a.k.a. offset = 0).

> 
> Meaning it starts at the same offset as 'physical_start' in the right
> side box?
> 
>>    Boundary   |         |      |         |        |         |
>>               |         |      |         |        |         |
>>               |         |----->|         |        |         |
>>               |         |iommu |         |        |         |
>>               |         | map  |         |        |         |
>>               |         |      |         |        |         |
>>   IOMMU Page  .---------.      .---------.        .---------.
>>    Boundary   |         |      |         |        |         |
>>               |         |----->|         |        |         |
>>               |         |iommu |         |        |         |
>>               |         | map  |         |        |         |
>>               |         |      |         |        |         |
>>   IOMMU Page  |         |      |         |        |         |
>>    Boundary   .---------.      .---------.        .---------.
>>               |         |      |         |------->|         |
>>    buffer_end '---------'      '---------' swiotlb|         |
>>               |         |----->|         |   map  |         |
>>               |         |iommu |         |        |         |
>>               |         | map  |         |        '---------' physical
>>               |         |      |         |        |         | _end
>>               '---------'      '---------'        '---------'
>>            Figure 2: A big view of simplified iommu bounce page
>>
>> The implementation of bounce buffers for untrusted devices
>> will cause a little performance overhead, but we didn't see
>> any user experience problems. The users could use the kernel
> 
> What kind of devices did you test it with?

Most test work was done by Xu Pengfei (cc'ed). He has run the code
on real platforms with various thunderbolt peripherals (usb, disk,
network, etc.).

> 
> Thank you for making this awesome cover letter btw!
> 

You are welcome.

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
