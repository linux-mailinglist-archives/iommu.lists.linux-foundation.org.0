Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1E3D246
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 18:30:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2B09ACB2;
	Tue, 11 Jun 2019 16:30:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DE728C6C
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 16:30:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6AF0476D
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 16:30:05 +0000 (UTC)
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 09EB02077F;
	Tue, 11 Jun 2019 18:30:03 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id C7A882046B;
	Tue, 11 Jun 2019 18:30:02 +0200 (CEST)
Subject: Re: [PATCH v1 0/3] PCIe and AR8151 on APQ8098/MSM8998
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Joerg Roedel <joro@8bytes.org>
References: <5eedbe6d-f440-1a77-8a7e-81a920e3a0e7@free.fr>
	<20190611155521.GA18411@redmoon>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <5af21357-5050-ee30-ddf9-df114d183fca@free.fr>
Date: Tue, 11 Jun 2019 18:30:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611155521.GA18411@redmoon>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
	Tue Jun 11 18:30:03 2019 +0200 (CEST)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
	MSM <linux-arm-msm@vger.kernel.org>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	iommu <iommu@lists.linux-foundation.org>, PCI <linux-pci@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

[ Trimming recipients list ]

On 11/06/2019 17:55, Lorenzo Pieralisi wrote:

> On Thu, Mar 28, 2019 at 05:59:48PM +0100, Marc Gonzalez wrote:
> 
>> After a lot of poking, I am finally able to use the AR8151 ethernet on the APQ8098 board.
>> The magic bits are the iommu-map prop and the PCIE20_PARF_BDF_TRANSLATE_N setup.
>>
>> The WIP thread is archived here:
>> https://marc.info/?t=155059539200004&r=1&w=2
>>
>>
>> Marc Gonzalez (3):
>>   PCI: qcom: Setup PCIE20_PARF_BDF_TRANSLATE_N
>>   arm64: dts: qcom: msm8998: Add PCIe SMMU node
>>   arm64: dts: qcom: msm8998: Add PCIe PHY and RC nodes
>>
>>  arch/arm64/boot/dts/qcom/msm8998.dtsi  | 93 ++++++++++++++++++++++++++
>>  drivers/pci/controller/dwc/pcie-qcom.c |  4 ++
>>  2 files changed, 97 insertions(+)
> 
> Marc,
> 
> what's the plan with this series ? Please let me know so that
> I can handle it correctly in the PCI patch queue, I am not
> sure by reading comments it has evolved much since posting.

Hello Lorenzo,

You can ignore/drop this series, it has been superseded; FWIW, the latest
patches no longer touch drivers/pci

The hold-up was finding an acceptable work-around for the $&#! bug in qcom's
SMMU emulation code. I hope Joerg will push it ASAP into linux-next so it can
receive some testing before 5.3-rc1.

The current incarnation of the PCIe PHY and RC nodes is:
https://patchwork.kernel.org/patch/10895341/

Regards.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
